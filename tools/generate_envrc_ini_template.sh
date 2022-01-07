#!/usr/bin/env bash
# """Generate template of `.envrc.ini` file from module documentation
#
# SYNOPSIS:
#
#   ./generate_envrc_ini_template.sh
#
# DESCRIPTION:
#
#   THIS SCRIPTS REQUIRES DIRECTORY ENVIRONMENT TO BE ACTIVATED.
#
#   For each module scripts in modules folder, extract `.envrc.ini` example in
#   the module docstring and generate file `templates/envrc.template.ini`.
#
# """

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


generate_envrc_ini()
{
  # """Extract `.envrc.ini` example of each module and write it in `templates/envrc.template.ini`.
  #
  #   For each module scripts in modules folder, extract `.envrc.ini` example in
  #   the module docstring and generate file `templates/envrc.template.ini`.
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

  local output_file=${DIRENV_ROOT}/templates/envrc.template.ini

  cat <<EOM > "${output_file}"
# DIRENV MODULE CONFIGURATION
# ==============================================================================
# DESCRIPTION:
#   Configuration file parsed during activation of direnv (either using \`direnv\`
#   or when sourcing \`.direnv/activate_direnv\`)'

EOM

  for i_module in "${DIRENV_ROOT}"/modules/*.sh
  do
    direnv_log "INFO" \
      "Computing \`.envrc.ini\` template for module **$(basename "${i_module}")**."
    # shellcheck disable=SC2016,SC2026
    # - SC2016: Expression don't expand in single quotes
    # - SC2026: This word (`p`) is outside of quotes
    sed -n -e '/^#   ```ini/,/^#   ```/'p "${i_module}" \
      | sed -e 's/#   //' -e '/^```/d' >> "${output_file}"
    echo "" >> "${output_file}"
  done

  cat <<EOM >> "${output_file}"
# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=dosini
# ------------------------------------------------------------------------------
EOM
}

main()
{
  # """Main method starting the generation of `.envrc.template.ini`
  #
  # Ensure directory environment is loaded, then load libraries scripts and
  # finally generate the `.envrc.template.ini`.
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

  # Ensure directory environment is activated
  if [[ -z "${DIRENV_ROOT}" ]]
  then
    # Not using direnv_log as directory environment is not loaded yet
    echo -e "${e_error}[ERROR] Direnv must be activated to use this script.${e_normal}"
    return 1
  fi

  generate_envrc_ini
}

main

# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=bash: foldmethod=indent
# ------------------------------------------------------------------------------
