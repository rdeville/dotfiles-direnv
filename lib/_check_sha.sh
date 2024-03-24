#!/usr/bin/env bash

_check_sha1()
{
  # """Ensure the SHA1 of a file is valid
  #
  # Ensure the SHA1 of a file provided as argument corresponding the value of
  # a previously computed SHA1 to ensure the file has not been modified.
  #
  # Globals:
  #   DIRENV_ROOT
  #
  # Arguments:
  #   $1: string, path to the file to test
  #
  # Output:
  #   Log message to inform user SHA does not correspond to expected value
  #
  # Returns:
  #   0 if SHA1 is valid
  #   1 if SHA1 is not valid
  #
  # """
  local file=$1
  # shellcheck disable=SC2155
  local file_name="$(basename "${file}" | sed -e "s/^\.//")"
  # shellcheck disable=SC2155
  local file_dir="$(dirname "${file}")"

  # shellcheck disable=SC2155
  local sha1_file="${XDG_CACHE_HOME:-${HOME}/.cache}/direnv${file_dir/${HOME}/}/${file_name}.sha1"

  if ! [[ -f "${sha1_file}" ]]
  then
    ! [[ -d "$(dirname "${sha1_file}")" ]] && mkdir -p "$(dirname "${sha1_file}")"
    sha1sum "${file}" > "${sha1_file}"
  elif ! sha1sum -c "${sha1_file}" &> /dev/null
  then
    file=${file/${HOME}/\~}
    sha1_file=${sha1_file/${HOME}/\~}
    _log "ERROR" "SHA1 of **\`${file}\`** differs from **\`${sha1_file}\`**."
    return 1
  fi
  return 0
}
