#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" || exit 1 >/dev/null 2>&1 ; pwd -P )"

declare -A NODES

NODES["${SCRIPTPATH}"]="${HOME}/.config/direnv"

source "${SCRIPTPATH}/lib/_direnv_log.sh"

cd "${SCRIPTPATH}" || exit 1

if git remote -v | grep -q 'rdeville.private'
then
  for i_node in "${!NODES[@]}"
  do
    src="${i_node}"
    dest="${NODES[${i_node}]}"

    if ! [[ -d "$(dirname "${dest}")" ]]
    then
      mkdir -p "$(dirname "${dest}")"
    fi

    if ! [[ -L "${dest}" ]]
    then
      direnv_log "INFO" "Bootstrap: Create symlink to **${dest/${HOME}/\~}**."
      ln -s "${src}" "${dest}"
    else
      direnv_log "INFO" "Bootstrap: Symlink to **${dest/${HOME}/\~}** already exists."
    fi
  done
fi
