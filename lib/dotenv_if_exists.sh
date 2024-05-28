#!/usr/bin/env bash

dotenv_if_exists() {
  # """Source dot environment file '.env' provided as arguments if file exists
  #
  # Check that provided dot file exists load it in the current environment
  # and watch if it exits.
  #
  # Usage:
  #   dotenv_if_exists [<rel_path_file>]
  #
  # Arguments:
  #   $1: string (optional), relative path to the file to source, `.env` if not
  #       specified
  #
  # Returns:
  #   0 anyway
  #
  # """
  _log "TRACE" "direnv: dotenv_if_exists()"

  local file="${PWD}/${1:-".env"}"
  local direnv
  direnv=$(which direnv)

  if ! [[ -f ${file} ]]
  then
    _log "DEBUG" "direnv: File **${file/${HOME}/\~}** does not exits, nothing to load"
    return
  fi

  _log "INFO" "direnv: Dotenv   **${file/${HOME}/\~}**"
  eval "$("$direnv" dotenv bash "${file}")"

  _log "INFO" "direnv: Watching **${file/${HOME}/\~}**"
  watch_file "${file}"
}