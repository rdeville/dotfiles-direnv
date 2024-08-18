#!/usr/bin/env bash

use_keepass() {
  # """Ensure keepass environment allow to access to keepass database
  #
  # **NAME**
  #   use_keepass
  #
  # **RETURN CODE**
  #   0 if anything is good
  #   1 if something goes wrong such as no keepassxc-cli, missing or wrong
  #     variable, etc.
  #
  # """
  _log "TRACE" "direnv: use_keepass()"

  local error="false"

  if ! has keepassxc-cli; then
    _log "ERROR" "Command **\`keepassxc-cli\`** does not exist."
    _log "ERROR" "Please refer to your OS distribution to install keepassxc-cli."
    return 1
  fi

  # Ensure every required variable are defined
  for i_var in "KEEPASS_DB" "KEEPASS_KEYFILE"; do
    _log "TRACE" "direnv: Tesing validity of variable **\`${name}\`**."
    name="${i_var}"
    value="${!i_var}"

    if [[ -z "${value}" ]]; then
      _log "ERROR" "Variable **\`${name}\`** should be set. "
      error="true"
    fi

    if ! [[ -f "${value}" ]]; then
      _log "ERROR" "File defined by variable **\`${name}\`** does not exist."
      error="true"
    fi
  done

  [[ "${error}" == "true" ]] && return 1

  if ! keepassxc-cli ls --no-password -k "${KEEPASS_KEYFILE}" "${KEEPASS_DB}" >/dev/null 2>&1; then
    _log "ERROR" "Unable to open the keepass DB with provided **KEEPASS variables**!"
    return 1
  fi
}

# vim: ft=bash
