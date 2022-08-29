#!/usr/bin/env bash
# """Export arbitrary variables
#
# DESCRIPTION:
#   Simply execute list of custom cmd
#
#   Parameters in `.envrc.ini` are:
#
#   <center>
#
# | Name        | Description                              |
# | :---------- | :----------------------------            |
# | `CMD`  | Commands to execute |
#
#   </center>
#
#   ## Parameters
#
#   ### `CMD`
#
#   Command to execute
#
#   ## `.envrc.ini` example
#
#   Corresponding entry in `.envrc.ini.template` are:
#
#   ```ini
#   # export module
#   # ------------------------------------------------------------------------------
#   # Export arbitrary variables
#   [custom_cmd]
#   # Specify variable name and value to export
#   CMD_NAME="echo 'value'"
#   CMD_ANOTHER_NAME="echo 'value'"
#   ```
#
# """

custom_cmd()
{
  # """Custom CMD
  #
  # Export variables
  #
  # Arguments:
  #   None
  #
  # Output:
  #   Log information
  #
  # Returns:
  #   1 if required variables are not set or if database can not be unlocked
  #   0 if everything is right and database can be unlocked
  #
  # """

  # shellcheck disable=SC2154
  #   - SC2514: custom_cmd is referenced but not assigned
  for i_key in "${!custom_cmd[@]}"
  do
    cmd="${custom_cmd[${i_key}]}"
    eval "${cmd}"
  done
}


deactivate_export_var()
{
  # """Do nothing as there is nothing to do
  #
  # Globals:
  #   None
  #
  # Arguments:
  #   None
  #
  # Output:
  #   None
  #
  # Returns:
  #   None
  #
  # """
  echo ""
}

# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=bash: foldmethod=indent
# ------------------------------------------------------------------------------
