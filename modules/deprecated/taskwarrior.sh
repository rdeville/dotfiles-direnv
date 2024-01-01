#!/usr/bin/env bash
# """Setup taskwarrior variable to ease use of taskwarrior
#
# DESCRIPTION:
#   Export some required variable used by the script. Finally ensure that
#   exported variables are valid, i.e. the taskwarrior database can be
#   unlocked using taskwarrior keyfile.
#
#   Parameters in `.envrc.ini` are:
#
#   <center>
#
# | Name                 | Description                                           |
# | :-----------------   | :---------------------------------------------------- |
# | `TASKWARRIOR_TASKRC` | Absolute path to a taskwarrior .taskrc config file  |
#
#   </center>
#
#   ## Parameters
#
#   ### `TASKWARRIOR_TASKRC`
#
#   Absolute path to a taskwarrior config file database, you can use `~`,
#   `${HOME}` or even `${DIRENV_ROOT}` to define path relatively.
#
#   ## `.envrc.ini` example
#
#   Corresponding entry in `.envrc.ini.template` are:
#
#   ```ini
#   # taskwarrior module
#   # ------------------------------------------------------------------------------
#   # Set taskwarrior environment variable
#   [taskwarrior]
#   # Specify the path to the taskwarrior config file
#   TASKWARRIOR_TASKRC=${DIRENV_ROOT}/.taskrc
#   ```
#
# """

taskwarrior()
{
  # """Export taskwarrior variable
  #
  # Ensure that exported variables are # valid, i.e. the taskwarrior database
  # can be unlocked using taskwarrior keyfile.
  #
  # Globals:
  #   TASKWARRIOR_TASKRC
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


  check_variable()
  {
    # """Ensure variables are defined
    #
    # Ensure the value provided as second argument is not null. First argument
    # is the name of the variable associated with the value.
    #
    # Globals:
    #   None
    #
    # Arguments:
    #   $1: string, name of the variable to check
    #   $2: string, value of the variable to check
    #
    # Output:
    #   Error log when variable value is not set
    #
    # Returns:
    #   1 if variable value is not set
    #   0 if variable value is set
    #
    # """

    local var_name=$1
    local var_value=$2
    if [[ -z "${var_value}" ]]
    then
      direnv_log "ERROR" "Variable **\`${var_name}\`** should be set in .envrc.ini. "
      return 1
    fi
  }

  # shellcheck disable=SC2154
  #   - SC2514: taskwarrior is referenced but not assigned
  local taskwarrior_taskrc=${taskwarrior[TASKWARRIOR_TASKRC]}

  # shellcheck disable=SC2089
  #   - SC2089: Quotes\Backslash will be treated litteraly
  local error="false"
  local export_var_name
  local export_var_value

  # Ensure taskwarriorxc-cli is installed
  if ! command -v task > /dev/null 2>&1
  then
    direnv_log "ERROR" "Command **\`task\`** does not exists."
    direnv_log "ERROR" "Please refer to your OS distribution to install taskwarrior"
    return 1
  fi

  # Ensure every required variable are defined
  # shellcheck disable=SC2043
  # - SC2043: This loop will only ever run once. Bad quoting or missing glob/expansion?
  for i_var in "taskwarrior_taskrc"
  do
    export_var_name="$(echo "${i_var}" | tr '[:lower:]' '[:upper:]')"
    # shellcheck disable=SC2116
    #   - SC2116: Useless echo ?
    export_var_value="$(eval "$(echo "echo \"\${${i_var}}\"" )" )"
    check_variable "${export_var_name}" "${export_var_value}" \
      || error="true"
  done
  if [[ "${error}" == "true" ]]
  then
    return 1
  fi

  # Export variable
  export TASKRC=${taskwarrior_taskrc}
}


deactivate_taskwarrior()
{
  # """Unset exported variables for taskwarrior module
  #
  # Unset `TASKWARRIOR_*` variable previously exported.
  #
  # Globals:
  #   TASKWARRIOR_DB
  #   TASKWARRIOR_KEYFILE
  #   TASKWARRIOR_NAME
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

  unset TASKRC
}

# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=bash: foldmethod=indent
# ------------------------------------------------------------------------------
