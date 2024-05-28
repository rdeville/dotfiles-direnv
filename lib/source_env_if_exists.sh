#!/usr/bin/env bash

source_env_if_exists() {
  # """Source environment file provided as arguments if file exists
  #
  # Check that provided file exists and ensure its SHA sum does not differ
  # from previously authorization.
  #
  # Usage:
  #   source_env_if_exists <rel_path_file>
  #
  # Arguments:
  #   $1: string, path to the file to source
  #
  # Returns:
  #   0 if anything is good
  #   1 if sha of file is not valid or if file does not exists
  #
  # """
  _log "TRACE" "direnv: source_env_if_exists()"

  local file="${PWD}/${1:-}"

  if [[ -f "${file}" ]]
  then
    if ! _check_sha "${file}"
    then
      return 1
    else
      _log "INFO" "direnv: Sourcing **${file/${HOME}/\~}**"
      source_env "${file}"
      return 0
    fi
  fi
  _log "DEBUG" "direnv: File **${file/${HOME}/\~}** does not exists, nothing to source."
  return 1
}