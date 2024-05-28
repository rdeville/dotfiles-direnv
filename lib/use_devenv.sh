#!/usr/bin/env bash

use_devenv() {
  # """If devenv environment exists, load and watch ti
  #
  # Usage:
  #   use_devenv
  #
  # Returns:
  #   0 if anything is good
  #
  # """
  _log "TRACE" "direnv: use_devenv()"

  local file="${PWD}/devenv.nix"

  if [[ -f "${file}" ]]
  then
    source_url \
      "https://raw.githubusercontent.com/cachix/devenv/95f329d49a8a5289d31e0982652f7058a189bfca/direnvrc" \
      "sha256-d+8cBpDfDBj41inrADaJt+bDWhOktwslgoP5YiGJ1v0="

    _log "INFO" "direnv: Watching **${file/${HOME}/\~}**"
    watch_file "${PWD}/devenv.nix"

    _log "DEBUG" "direnv: Loading devenv environment defined in **${file/${HOME}/\~}**"
    use devenv
  fi
}

# vim: ft=bash