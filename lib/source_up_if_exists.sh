#!/usr/bin/env bash

source_up_if_exists(){
  parent="$(cd ../ && find_up .envrc)"
  if [[ -n "${parent}" ]]
  then
    if _check_sha1 "${parent}"
    then
      source_up
    else
      _log "WARNING" "File **${parent}** (and possible parent) will not be sourced"
    fi
  fi
}