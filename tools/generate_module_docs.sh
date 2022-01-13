#!/usr/bin/env bash
# """Generate mkdocs documentation for each modules
#
# SYNOPSIS:
#
#   ./generate_module_docs.sh
#
# DESCRIPTION:
#
#   THIS SCRIPTS REQUIRES DIRECTORY ENVIRONMENT TO BE ACTIVATED.
#
#   For each script in modules folder, extract docstring describing the module
#   usage and write corresponding documentation to `docs/modules/` folder.
#
# """

# Output folder
DIRENV_MODULE_FOLDER="${DIRENV_ROOT}/modules"

# shellcheck disable=SC2034
#   - SC2034: var appears unused, Verify use (or export if used externally)
direnv_log()
{
  # """Print debug message in colors depending on message severity on stderr
  #
  # Echo colored log depending on user provided message severity. Message
  # severity are associated to following color output:
  #
  #   - `DEBUG` print in the fifth colors of the terminal (usually magenta)
  #   - `INFO` print in the second colors of the terminal (usually green)
  #   - `WARNING` print in the third colors of the terminal (usually yellow)
  #   - `ERROR` print in the third colors of the terminal (usually red)
  #
  # If no message severity is provided, severity will automatically be set to
  # INFO.
  #
  # Globals:
  #   None
  #
  # Arguments:
  #   $1: string, message severity or message content
  #   $@: string, message content
  #
  # Output:
  #   Log informations colored
  #
  # Returns:
  #   None
  #
  # """

  # Store color prefixes in variable to ease their use.
  # Base on only 8 colors to ensure portability of color when in tty
  local e_normal="\e[0m"     # Normal (usually white fg & transparent bg)
  local e_bold="\e[1m"       # Bold
  local e_underline="\e[4m"  # Underline
  local e_debug="\e[0;34m"   # Fifth term color (usually magenta fg)
  local e_info="\e[0;32m"    # Second term color (usually green fg)
  local e_warning="\e[0;33m" # Third term color (usually yellow fg)
  local e_error="\e[0;31m"   # First term color (usually red fg)

  # Store preformated colored prefix for log message
  local error="${e_bold}${e_error}[ERROR]${e_normal}${e_error}"
  local warning="${e_bold}${e_warning}[WARNING]${e_normal}${e_warning}"
  local info="${e_bold}${e_info}[INFO]${e_normal}${e_info}"
  local debug="${e_bold}${e_debug}[INFO]${e_normal}${e_debug}"

  local color_output="e_error"
  local msg_severity
  local msg

  # Not using ${1^^} to ensure portability when using ZSH
  msg_severity=$(echo "$1" | tr '[:upper:]' '[:lower:]')

  if [[ "${msg_severity}" =~ ^(error|time|warning|info|debug)$ ]]
  then
    # Shift arguments by one such that $@ start from the second arguments
    shift
    # Place the content of variable which name is defined by ${msg_severity}
    # For instance, if `msg_severity` is INFO, then `prefix` will have the same
    # value as variable `info`.
    prefix="${!msg_severity}"
    color_output="e_${msg_severity}"
  else
    prefix="${info}"
  fi
  color_output="${!color_output}"

  # Concat all remaining arguments in the message content and apply markdown
  # like syntax.
  msg_content=$(echo "$*" | \
    sed -e "s/ \*\*/ \\${e_bold}/g" \
        -e "s/\*\*\./\\${e_normal}\\${color_output}./g" \
        -e "s/\*\* /\\${e_normal}\\${color_output} /g" \
        -e "s/ \_\_/ \\${e_underline}/g" \
        -e "s/\_\_\./\\${e_normal}\\${color_output}./g" \
        -e "s/\_\_ /\\${e_normal}\\${color_output} /g")
  msg="${prefix} ${msg_content}${e_normal}"

  # Print message
  echo -e "${msg}" 1>&2
}

generate_doc()
{
  # """Extract modules docstring and write corresponding documentation
  #
  #   For each script in modules folder, extract docstring describing the module
  #   usage and write corresponding documentation to `docs/modules/` folder.
  #
  # Globals:
  #   DIRENV_MODULE_FOLDER
  #   DIRENV_ROOT
  #
  # Arguments:
  #   None
  #
  # Output:
  #   None
  #
  # Returns:
  #   None
  #
  # """

  local line_from
  local line_to
  local i_line
  local i_node
  local module_name
  local doc_content
  local output_file
  local module_index="${DIRENV_ROOT}/docs/modules/index.md"

  mkdir -p "$(dirname "${module_index}")"

  cat <<EOM > "${module_index}"
# Modules

Modules are part of \`direnv\` which run tasks related to a specific
environment, for instance module \`ansible\` will only execute task related to
\`ansible\`, etc.

## List of exisitng modules

<center>

| Module Name | Description |
| :---------- | :---------- |
EOM


  for i_node in "${DIRENV_MODULE_FOLDER}"/*.sh
  do
    while read -r i_line
    do
      if [[ -z "${line_from}" ]]
      then
        line_from=${i_line}
      elif [[ -z "${line_to}" ]]
      then
        line_to=${i_line}
      fi
    done <<< "$(grep -n -e "^# \"\"\"" "${i_node}" | cut -d ":" -f 1)"
    # - SC2295: Expansion inside ${..} need to be quoted separately
    # shellcheck disable=SC2295
    module_name=${i_node##${DIRENV_MODULE_FOLDER}\/}
    module_name=${module_name%%.sh}

    if [[ -z "${line_from}" ]] || [[ -z "${line_to}" ]]
    then
      direnv_log "ERROR" "Incomplete documentation for module **${module_name}**."
    else
      direnv_log "INFO" "Generate documentation for module **${module_name}**."
      output_file="${DIRENV_ROOT}/docs/modules/${module_name}.md"
      doc_content="$(sed -n "${line_from},${line_to}"p "${i_node}")"

      # Extract module documentation
      doc_content="$(sed -n -e "/^# \"\"\".*/,/^# \"\"\"/"p "${i_node}" \
                    | sed -e "s/^# \"\"\"//g" \
                          -e "s/^# //g" \
                          -e "s/^  //g" \
                          -e "s/^#$//g" \
                          -e "s/DESCRIPTION[:]/## Description\n/g" \
                          -e "s/COMMANDS[:]/## Commands\n/g" \
                          -e "s/OPTIONS[:]/## Options\n/g" \
                          -e "s/SYNOPSIS[:]/## Synopsis\n/g" \
      )"
      doc_header=$(echo "${doc_content}" | head -n 1)
      echo "# ${module_name}" > "${output_file}"
      echo "${doc_content}" >> "${output_file}"
      echo "| [${module_name}](${module_name}.md) | ${doc_header} |" >> "${module_index}"
    fi
    line_from=""
    line_to=""
  done

  cat <<EOM >> "${module_index}"

</center>
EOM
}

main()
{
  # """Main method starting the generation of `.envrc.template.ini`
  #
  # Ensure directory environment is loaded, then load libraries scripts and
  # finally generate the modules documentations
  #
  # Globals:
  #   DIRENV_ROOT
  #
  # Arguments:
  #   None
  #
  # Output:
  #   None
  #
  # Returns:
  #   None
  #
  # """

  # Store coloring output prefix
  local e_normal="\e[0m"     # normal (white fg & transparent bg)
  local e_error="\e[0;31m"   # red fg

  # Ensure directory environment is activated
  if [[ -z "${DIRENV_ROOT}" ]]
  then
    # Not using direnv_log as directory environment is not loaded yet
    echo -e "${e_error}[ERROR] Direnv must be activated to use this script.${e_normal}"
    return 1
  fi

  generate_doc
}

main

# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=bash: foldmethod=indent
# ------------------------------------------------------------------------------
