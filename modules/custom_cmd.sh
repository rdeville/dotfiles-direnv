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
# | `CMD`       | Commands to execute                      |
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
#   # Custom command module
#   # ------------------------------------------------------------------------------
#   # Execute arbitrary command
#   [custom_cmd]
#   # Specify command to execute, variable name does not matter.
#   CMD_NAME=echo 'value'
#   CMD_ANOTHER_NAME=echo 'value'
#   ```
#
# """

custom_cmd()
{
  # """Custom command
  #
  # Execute command
  #
  # Arguments:
  #   None
  #
  # Output:
  #   Log information
  #
  # Returns:
  #   1 if a command failed
  #   0 if everything is right and database can be unlocked
  #
  # """

  # shellcheck disable=SC2154
  #   - SC2514: custom_cmd is referenced but not assigned
  for i_key in "${!custom_cmd[@]}"
  do
    cmd="${custom_cmd[${i_key}]}"
    eval "${cmd}"
    # shellcheck disable=SC2181
    if [[ $? -ne 0 ]]
    then
      return 1
    fi
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