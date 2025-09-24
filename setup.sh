#!/usr/bin/env bash
# shellcheck disable=SC2155,SC2034
#
SCRIPTPATH="$(
	cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit 1
	pwd -P
)"
SCRIPTNAME="$(basename "$0")"
ROOT_DIR=$(git rev-parse --show-toplevel)

init_logger() {
	local log_file="${XDG_CACHE_HOME:-${HOME}/.cache}/snippets/_log.sh"
	local last_download_file="/tmp/_log.time"
	local delai=14400 # 4 hours
	# shellcheck disable=SC2155
	local curr_time=$(date +%s)
	local time="$((curr_time - $(cat "${last_download_file}" 2>/dev/null || echo "0")))"

	if ! [[ -f "${log_file}" ]] ||
		{ [[ -f "${log_file}" ]] && [[ "${time}" -gt "${delai}" ]]; }; then
		if ping -q -c 1 -W 1 framagit.org &>/dev/null; then
			# shellcheck disable=SC1090
			source <(curl -s https://framagit.org/-/snippets/7183/raw/main/_get_log.sh)
			echo "${curr_time}" >"${last_download_file}"
		else
			echo -e "\033[1;33m[WARNING]\033[0;33m Unable to get last logger version, will use \`echo\`.\033[0m"
			_log() {
				echo "$@"
			}
		fi
	else
		# shellcheck disable=SC1090
		source <(cat "${log_file}")
	fi
}

check_dest_exists() {
	_log "DEBUG" "check_dest_exists()"
	local src="${1}"
	local dst="${1/${ROOT_DIR}/${HOME}}"
	dst=${dst//envrc/.envrc}
	if [[ -d $(dirname "${dst}") && -f "${dst}" ]]; then
		_log "INFO" "Dest file **${dst/${HOME}/\~}** exists."
	elif [[ -d "$(dirname "${dst}")" && ! -f "${dst}" ]]; then
		_log "WARNING" "Directory for dest file **${dst/${HOME}/\~}** exists, will setup symlink"
		ln -s "${src}" "${dst}"
	else
		_log "ERROR" "Dest file **${dst/${HOME}/\~}** does not exists."
		_log "ERROR" "Source file **${src/${HOME}/\~}** will be deleted."
		rm -f "${src}"
	fi
}

process_dir() {
	_log "DEBUG" "process_dir()"
	local dir="$1"
	for node in "${dir}"/*; do
		if [[ -d "${node}" ]]; then
			process_dir "${node}"
		elif [[ -f "${node}" ]] && {
		  [[ "$(basename "${node}")" == "envrc.local" ]] ||
		  [[ "$(basename "${node}")" == "envrc" ]]
		  }; then
			check_dest_exists "${node}"
		fi
	done
}

main() {
	local DEBUG_LEVEL="${DEBUG_LEVEL:-INFO}"
	init_logger
	process_dir "${ROOT_DIR}"
}

main "$@"

# vim: ft=sh
