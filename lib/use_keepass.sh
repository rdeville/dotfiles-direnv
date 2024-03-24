#!/usr/bin/env bash
# """TODO
# """

use_keepass()
{
  # """Install keepass wrapper and export keepass variable required for wrapper
  #
  # Install a symlink from `.direnv/src/keepass.sh` to `.direnv/bin/keepass` to
  # be able to use script wrapper as keepass command. Also export some required
  # variable used by the script. Finally ensure that exported variables are
  # valid, i.e. the keepass database can be unlocked using keepass keyfile.
  #
  # Globals:
  #   KEEPASS_DB
  #   KEEPASS_KEYFILE
  #   KEEPASS_NAME
  #
  # Arguments:
  #   None
  #
  # Output:
  #   Log information
  #
  # Returns:
  #   1 if required variables are not set or if database can not be unlocked
  #   0 if everything is right and database can be unlocked
  #
  # """
  _check_variable()
  {
    local var_name=$1
    local var_value=$2
    if [[ -z "${var_value}" ]]
    then
      _log "ERROR" "Variable **\`${var_name}\`** should be set in \`.envrc\`. "
      return 1
    fi
  }

  _check_file()
  {
    local var_name=$1
    local var_value=$2
    if ! [[ -f "${var_value}" ]]
    then
      _log "ERROR" "File defined by variable **\`${var_name}\`** does not exists."
      return 1
    fi
  }

  local error="false"

  # Ensure keepassxc-cli is installed
  if ! has keepassxc-cli
  then
    _log "ERROR" "Command **\`keepassxc-cli\`** does not exists."
    _log "ERROR" "Please refer to your OS distribution to install keepassxc-cli"
    return 1
  fi

  # Ensure every required variable are defined
  for i_var in "KEEPASS_DB" "KEEPASS_KEYFILE"
  do
    name="${i_var}"
    value="${!i_var}"
    _check_variable "${name}" "${value}" \
      && _check_file "${name}" "${value}" \
      || error="true"
  done
  [[ "${error}" == "true" ]] && return 1

  # Ensure variables are correct and allow to unlock the database
  local keepass_test_cmd=""

  if ! keepassxc-cli ls --no-password -k "${KEEPASS_KEYFILE}" "${KEEPASS_DB}" > /dev/null 2>&1
  then
    _log "ERROR" "Unable to open the keepass DB with provided **KEEPASS variables**!"
    return 1
  fi
}

# vim: ft=bash