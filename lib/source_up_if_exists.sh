#!/usr/bin/env bash

source_up_if_exists() {
  # """Source parent environment file provided as arguments if file exists
  #
  # Check that parent env file exists and ensure its SHA sum does not differ
  # from previously authorization.
  #
  # Returns:
  #   0 if no parent or if anything is good
  #   1 if sha of parent env file is not valid
  #
  # """
  _log "TRACE" "direnv: source_up_if_exists()"

  parent="$(cd ../ && find_up .envrc)"

  if [[ -n "${parent}" ]]
  then
    if ! _check_sha "${parent}"
    then
      _log "WARNING" "direnv: File **${parent}** (and possible parent) will not be sourced"
      return 1
    else
      _log "INFO" "direnv: Sourcing **${parent/${HOME}/\~}**"
      source_up
      return 0
    fi
  fi
  _log "DEBUG" "direnv: No more parent direnv file to load"
  return 0
}