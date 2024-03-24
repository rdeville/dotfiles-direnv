#!/usr/bin/env bash

use_devbox() {
  watch_file "${DIRENV_ROOT}/devbox.json"
  eval "$(devbox shellenv --init-hook --install --no-refresh-alias)"
}

