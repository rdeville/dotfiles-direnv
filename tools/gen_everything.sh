#!/usr/bin/env bash
# """Generate template for everything using all scripts in `tools`
#
# SYNOPSIS:
#
#   ./gen_everything.sh
#
# DESCRIPTION:
#
#   THIS SCRIPTS REQUIRES DIRECTORY ENVIRONMENT TO BE ACTIVATED.
#
#   For each generate_* scripts in tools folder, execute them
#
# """


SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
OLD_PWD=${PWD}

cd "$(dirname ${SCRIPTPATH})" || exit 1

# shellcheck disable=SC2231
for i_gen in ./tools/generate_*.sh
do
  ${i_gen}
done

cd "${OLD_PWD}" || exit 1
