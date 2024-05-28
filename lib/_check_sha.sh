#!/usr/bin/env bash

_check_sha() {
  # """Ensure the sha of a file is valid
  #
  # Ensure the sha of a file provided as argument corresponding the value of
  # a previously computed sha to ensure the file has not been modified.
  #
  # Arguments:
  #   $1: string, path to the file to test
  #
  # Output:
  #   Log message to inform user SHA does not correspond to expected value
  #
  # Returns:
  #   0 if sha is valid
  #   1 if sha is not valid
  #
  # """
  _log "TRACE" "direnv: _check_sha()"

  local file=$1
  # shellcheck disable=SC2155
  local file_name="$(basename "${file}" | sed -e "s/^\.//")"
  # shellcheck disable=SC2155
  local file_dir="$(dirname "${file}")"
  local sha_file="${XDG_CACHE_HOME:-${HOME}/.cache}/direnv${file_dir/${HOME}/}/${file_name}.sha"

  if ! [[ -f "${sha_file}" ]]
  then
    _log "INFO" "direnv: Sha of **\`${file/${HOME}/\~}\`** does not exists yet."
    _log "INFO" "direnv: Will be computed in to **\`${sha_file/${HOME}/\~}\`** authorized"
    ! [[ -d "$(dirname "${sha_file}")" ]] && mkdir -p "$(dirname "${sha_file}")"
    shasum "${file}" > "${sha_file}"
  elif ! shasum -c "${sha_file}" &> /dev/null
  then
    _log "ERROR" "direnv: Sha of **\`${file/${HOME}/\~}\`** differs from **\`${sha_file/${HOME}/\~}\`**."
    return 1
  fi
  return 0
}