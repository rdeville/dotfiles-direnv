#!/usr/bin/env bash

source ~/.cache/snippets/_log.sh

update() {
  local file_path="$1"

  _log "TRACE" "update()"
  _log "DEBUG" "Update file ${file_path}"
  _log "WARNING" "Update file ${file_path}"

  local pattern="source_up_if_exists\n"

  local shebang="#!\/usr\/bin\/env bash\n"

  # Ensure files start with:
  # ```
  # #!/usr/bin/env bash
  #
  # ${pattern}
  #
  # ```
  if grep -A 1 "#!/usr/bin/env" "${file_path}" | grep -q "# shellcheck"; then
    local shellcheck="# shellcheck disable=SC...."
    sed -i \
      -z "s/\(${shebang}${shellcheck}\n\)\(.*\)\(${pattern}\)\(.*\)/\1\n${pattern}\2\4/g" \
      "${file_path}"
  else
    sed -i \
      -z "s/\(${shebang}\)\(.*\)\(${pattern}\)\(.*\)/\1\n${pattern}\n\2\4/g" \
      "${file_path}"
  fi

  # Remove line comporting ${pattern}
  pattern="use_tmux"
  sed -i \
    -e "/${pattern}/d" \
    "${file_path}"

  sed -i -z "s/\n\n\n/\n\n/g" "${file_path}"

  return
}
