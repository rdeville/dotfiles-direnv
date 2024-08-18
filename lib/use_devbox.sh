#!/usr/bin/env bash

use_devbox() {
  # """If devbox environment exists, load and watch it
  #
  # **NAME**
  #   use_devbox
  #
  # **DESCRIPTION**
  #   Load file provided as arguments or devbox.json relative to direnv root as
  #   a \`devbox.json\` environment
  #
  # **OPTIONS**
  #   **FILE**: string, path to the devbox.json file
  #
  # **EXAMPLES**
  #   use_devbox filename.json
  #
  # **RETURN CODE**
  #   1 if devbox json file does not exists
  #   0 if anything is good
  #
  # """
  _log "TRACE" "direnv: use_devbox()"
  make_scripts_executables() {
    local key=$1
    local subkey="$2"
    local cmd="jq --arg key '${key}' "
    if [[ -n "${subkey}" ]]; then
      cmd+="--arg subkey '${subkey}' '.shell.${key}.${subkey}[]'"
      key="${key} ${subkey}"
    else
      cmd+="'.shell.${key}[]'"
    fi
    cmd+=" '${file}' | sed 's/\"//g'"
    cmd=$(eval "${cmd}")
    while read -r hook; do
      if [[ -f "${hook//\"/}" ]]; then
        _log "INFO" "direnv: 🛠️ Making ${key} **${hook}** executable."
        chmod +x "${hook}"
      fi
    done <<<"${cmd}"
  }

  local file

  [[ $1 =~ ^\/ ]] && file="${1}" || file="${PWD}/${1:-"devbox.json"}"

  if ! [[ -f "${file}" ]]; then
    _log "DEBUG" "direnv: File **${file/${HOME}/\~}** does not exist, nothing to do."
    return 1
  fi

  if ! type jq &>/dev/null; then
    _log "WARNING" "Command **jq** does not exist, unable to parse ${file/${HOME}/\~}."
  else
    if grep -q "init_hook" "${file}"; then
      make_scripts_executables "init_hook"
    fi
    if grep -q "scripts" "${file}"; then
      scripts=$(jq '.shell.scripts | keys | .[]' "${file}" | sed 's/"//g')
      while read -r script; do
        make_scripts_executables "scripts" "${script}"
      done <<<"${scripts}"
    fi
  fi

  _log "INFO" "direnv: 🚀 **${file/${HOME}/\~}**"
  eval "$(devbox shellenv --init-hook --install --no-refresh-alias)"

  _log "INFO" "direnv: 👀 **${file/${HOME}/\~}**."
  watch_file "devbox.json"
}

# vim: ft=bash
