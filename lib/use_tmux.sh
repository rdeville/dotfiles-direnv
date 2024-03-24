#!/usr/bin/env bash

use_tmux(){
  PWD=$(pwd)
  TMUXP_CONFIG=""
  if [[ "${PWD}" != "${HOME}" ]] \
    && [[ -n "${TMUXP_SESSION_NAME}" ]] \
    && [[ "$(tmux display-message -p '#S')" != "${TMUXP_SESSION_NAME}" ]]
  then
    TMUXP_CONFIG=${TMUXP_CONFIG:-""}
    _log "INFO" "Load tmux session **${TMUXP_SESSION_NAME}** ? [**Y**/n]"
    read -r answer
    answer=${answer:-y}
    answer=$(echo "${answer}" | tr '[:upper:]' '[:lower:]')
    if [[ "${answer}" =~ (y|ye|yes) ]]
    then
      tmuxp load -y "${TMUXP_CONFIG:-default}"
    fi
  fi
}