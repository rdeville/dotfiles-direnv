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

DEBUG_LEVEL=${DIRENV_DEBUG_LEVEL:-INFO}
source <(curl -s https://framagit.org/-/snippets/7183/raw/main/_log.sh)

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

  for i_node in "$@"
  do
    file_from="${direnv_dir}/${i_node}"
    if [[ -f "${file_from}" ]] && ! [[ "${file_from}" =~ __pycache__ ]]
    then
      _log "INFO" "Computing sha1 of **${direnv_dir}/${i_node}**."
      sha1sum "${direnv_dir}/${i_node}"  | sed -e "s|${direnv_dir}/||" >> "${sha1_file}"
    elif [[ -d "${file_from}" ]]
    then
      for i_subnode in "${file_from}"/*
      do
        # Remove every occurrences of `${DIRENV_ROOT}`
        i_subnode="${i_subnode//${direnv_dir}\//}"
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
  local direnv_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/direnv"
  local sha1_file="${direnv_dir}/direnv.sha1"
  if [[ -f "${sha1_file}" ]]
  then
    rm "${sha1_file}"
  fi

  compute_sha1 "${NODES[@]}"
}

main

# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=bash: foldmethod=indent
# ------------------------------------------------------------------------------