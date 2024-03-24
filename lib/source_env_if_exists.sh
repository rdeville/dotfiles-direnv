#!/usr/bin/env bash

source_env_if_exists(){
  local file="$1"
  if [[ -f "${file}" ]] && _check_sha1 "${file}"
  then
    source_env "${file}"
  fi
}

