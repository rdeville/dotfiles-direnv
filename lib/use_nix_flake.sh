#!/usr/bin/env bash

use_nix_flake() {
  # """If flake environment exists, load and watch ti
  #
  # Usage:
  #   use_nix_flake
  #
  # Returns:
  #   0 if anything is good
  #
  # """
  _log "TRACE" "direnv: use_nix_flake()"

  local file="${PWD}/flake.nix"

  if [[ -f "${file}" ]]
  then
    _log "INFO" "direnv: Watching **${file/${HOME}/\~}**"
    watch_file "${PWD}/flake.nix"

    _log "DEBUG" "direnv: Loading flake environment defined in **${file/${HOME}/\~}**"
    use flake . --impure
  fi
}

# vim: ft=bash