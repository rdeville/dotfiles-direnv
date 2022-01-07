#!/usr/bin/env bash
# """Recursively compute SHA1 sum of a list of files and folders
#
# SYNOPSIS:
#   ./compute_sha1.sh
#
# DESCRIPTION:
#   The script will compute SHA1 sum of every required files for directory
#   environment and store these SHA1 into the corresponding file in `.sha1`
#   folder with the same architecture.
#
# """

# List of files and folder
NODES=(
  ".envrc"
  "direnvrc"
  "lib"
  "src"
  "modules"
  "templates"
)

DIRENV_ROOT="$(git rev-parse --show-toplevel)"
# Output folder
DIRENV_SHA1="${DIRENV_ROOT}/.sha1"

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

compute_sha1()
{
  # """Main recursive method that compute SHA1 of files and folder
  #
  # Check if the nodes is a folder or a file.
  # If it is a file, compute its SHA1 sum and store it in `.sha1` folder.
  # If it is a folder, store the folder in a temporary array to be passed
  # recursively to this method.
  #
  # Globals:
  #   DIRENV_ROOT
  #   DIRENV_SHA1
  #
  # Arguments:
  #   $@: (optional) string, list of files and folders
  #
  # Output:
  #   Log informations
  #
  # Returns:
  #   None
  #
  # """

  local tmp_nodes=()
  local file_from
  local file_sha1

  for i_node in "$@"
  do
    file_from="${DIRENV_ROOT}/${i_node}"
    file_sha1="${DIRENV_SHA1}/${i_node}.sha1"

    if [[ -f "${file_from}" ]] && ! [[ "${file_from}" =~ __pycache__ ]]
    then
      direnv_log "INFO" "Computing sha1 of **${i_node}**."
      sha1sum "${file_from}" | cut -d " " -f 1 > "${file_sha1}"
    elif [[ -d "${file_from}" ]]
    then
      mkdir -p "${DIRENV_SHA1}/${i_node}"
      for i_subnode in "${file_from}"/*
      do
        # Remove every occurrences of `${DIRENV_ROOT}`
        i_subnode="${i_subnode//${DIRENV_ROOT}\//}"
        tmp_nodes+=("${i_subnode}")
      done
    fi
  done

  if [[ -n "${tmp_nodes[*]}" ]]
  then
    compute_sha1 "${tmp_nodes[@]}"
  fi
}

main()
{
  # """Ensure directory environment is activated an run SHA1 sum computation
  #
  # Globals:
  #   DIRENV_ROOT
  #
  # Arguments:
  #   None
  #
  # Output:
  #   Error informations
  #
  # Returns:
  #   1 if directory environment is not activated
  #   0 if everything went right
  #
  # """

  # Ensure `.sha1` directory exists
  if ! [[ -d "${DIRENV_SHA1}" ]]
  then
    mkdir -p "${DIRENV_SHA1}"
  fi
  compute_sha1 "${NODES[@]}"
}

main

# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=bash: foldmethod=indent
# ------------------------------------------------------------------------------