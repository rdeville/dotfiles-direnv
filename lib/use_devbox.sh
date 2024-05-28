#!/usr/bin/env bash

use_devbox() {
  # """If devbox environment exists, load and watch ti
  #
  # Usage:
  #   use_devbox
  #
  # Returns:
  #   0 if anything is good
  #
  # """
  _log "TRACE" "direnv: use_devbox()"

  local file="${PWD}/devbox.json"

  if [[ -f "${file}" ]]
  then
    _log "INFO" "direnv: Watching **${file/${HOME}/\~}**"
    watch_file "devbox.json"

    _log "DEBUG" "direnv: Loading devbox environment defined in **${file/${HOME}/\~}**"
    eval "$(devbox shellenv --init-hook --install --no-refresh-alias)"
    return 0
  fi
  return 1
}