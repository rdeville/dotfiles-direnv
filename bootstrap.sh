#!/usr/bin/env bash
# """TODO
# """

# shellcheck disable=SC2034
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit 1 ; pwd -P )"
SCRIPTNAME="$(basename "$0")"

declare -A NODES
NODES["${XDG_DATA_HOME:-${HOME}/.local/share}/direnv"]="${SCRIPTPATH}"

init_logger(){
  if ping -q -c 1 framagit.org &> /dev/null
  then
    # shellcheck disable=SC1090
    source <(curl -s https://framagit.org/-/snippets/7183/raw/main/_get_log.sh)
  else
    echo -e "\e[1;31m[ERROR]\e[0m\e[31m $0: Not able to ping \e[1;31mframagit.org\e[0m"
    echo -e "\e[1;31m[ERROR]\e[0m\e[31m $0: Script will now exit\e[0m"
    exit 1
  fi
}

create_dir(){
  local dir="$1"
  if ! [[ -d "${dir}" ]]
  then
    _log "INFO" "${SCRIPTNAME}: Create directory **${dir/${HOME}/\~}**"
    mkdir -p "${dir}"
  fi
}

setup_symlink(){
  local src=$1
  local dest=$2

  if ! [[ -e "${src}" ]]
  then
    _log "WARNING" "$SCRIPTNAME: Symlink source **${src/${HOME}/\~}** does not exists."
    _log "WARNING" "$SCRIPTNAME: Will create symlink anyway as you may setup source later."
  fi

  if [[ -e "${dest}" ]] && ! [[ -L "${dest}" ]]
  then
    _log "ERROR" "$SCRIPTNAME: **${dest/${HOME}/\~}** already exists and is not a symlink."
    return 1
  elif ! [[ -L "${dest}" ]]
  then
    _log "INFO" "$SCRIPTNAME: Create symlink to **${dest/${HOME}/\~}**."
    ln -s "${src}" "${dest}"
  else
    _log "INFO" "$SCRIPTNAME: Symlink to **${dest/${HOME}/\~}** already exists."
  fi
}

process_nodes_symlinks(){
  local src
  local dest
  for iNode in "${!NODES[@]}"
  do
    src="${NODES[$iNode]}"
    dest="${iNode}"

    create_dir "$(dirname "${dest}")"
    setup_symlink "${src}" "${dest}"
  done
}

main(){
  # TODO Change below substitution if need
  local DEBUG_LEVEL="${DEBUG_LEVEL:-INFO}"
  init_logger
  process_nodes_symlinks
  # TODO
}

main "$@"

# vim: ft=sh

