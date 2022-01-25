#!/usr/bin/env bash
# """Export tmuxp var and/or set `tmuxp.yaml` file to start tmux session
#
# DESCRIPTION:
#
#   If TMUXP_CONFIGDIR is set in `.envrc.ini`, export it to define where to
#   store tmuxp configuration per directory.
#
#   Then depending on variables set in modules, will either use an existing
#   tmuxp project or copy an existing template for the directory.
#
#   Finally, this will start a tmux session with tmuxp in detached state.
#
#   Parameters in `.envrc.ini` are:
#
#   <center>
#
#   | Name                    | Description                                                                                     |
#   | :---------------------- | :----------------------------------------------------------------------------------             |
#   | `TMUXP_CONFIGDIR`       | Directory location where to look/store tmuxp configurations.                                    |
#   | `tmuxp_session_name`    | (optional) Name of the tmux session (default set to dirname).                                   |
#   | `tmuxp_template`        | (optional) Name of the tmuxp configuration template to copy (default set to default)[^1]        |
#   | `tmuxp_project`         | (optional) Specify the name of the tmuxp file and the tmux session (default set to default)[^1] |
#
#   </center>
#
#   [^1]:
#       `tmuxp_template` and `tmuxp_project` are mutually exclusive as
#       the first will make a copy of the template while the later will use
#       (ERB)[https://github.com/tmuxp/tmuxp#erb].
#
#   ## Parameters
#
#   ### `TMUXP_CONFIGDIR`
#
#   Export a environment variable to specify to tmuxp where to look for
#   tmuxp session configuration files. Default set to
#   `XDG_CONFIG_DIR/tmuxp`.
#
#   ### `tmuxp_session_name`
#
#   Define the name of the tmux session, default set to dirname.
#
#   ### `tmuxp_template`
#
#   **Mutually exclusive with `tmuxp_project`**
#
#   Define the tmuxp template to use. This will copy the file
#   `${TMUXP_CONFIGDIR}/${tmuxp_template}.yaml` to
#   `${TMUXP_CONFIGDIR}/${tmuxp_session_name}.yaml` and will create
#   a symlink to it at `${DIRENV_ROOT}`.
#
#   If file `${TMUXP_CONFIGDIR}/${tmuxp_template}.yaml` does not
#   exists yet, it will be copied from
#   `templates/tmuxp/${tmuxp_template}.yaml`.
#
#   If `templates/tmuxp/${tmuxp_template}.yaml` does not exists an
#   error will be print and nothing related to tmuxp module will be done.
#
#   ### `tmuxp_project`
#
#   **Mutually exclusive with `tmuxp_template`**
#
#   Define the tmuxp project to use. This will use the file
#   `${TMUXP_CONFIGDIR}/${tmuxp_project}.yaml` to start a session
#   based on the project file and will create a symlink to it at
#   `${DIRENV_ROOT}`.
#
#   If file `${TMUXP_CONFIGDIR}/${tmuxp_template}.yaml` does not
#   exists yet, it will be copied from
#   `templates/tmuxp/${tmuxp_template}.yaml`.
#
#   If `templates/tmuxp/${tmuxp_template}.yaml` does not exists an
#   error will be print and nothing related to tmuxp module will be done.
#
#   ## `.envrc.ini` example
#
#   Corresponding entry in `.envrc.ini.template` are:
#
#   ```ini
#   # tmuxp module
#   # ------------------------------------------------------------------------------
#   # Start a tmux session from tmuxp config in detached states
#   [tmuxp_config]
#   # Location where tmuxp file are stored
#   TMUXP_CONFIGDIR="${XDG_CONFIG_DIR:-${HOME}/.config/}tmuxp/"
#   # Name of the session
#   tmuxp_session_name="cmd: dirname ${DIRENV_ROOT}"
#   # Template to use (copy and symlink)
#   #tmuxp_template="default"
#   # Project to use (run an instance)
#   tmuxp_project="default"
#   ```
#
# """

check_source_exist()
{
  # """Check that name of template or project is valid
  #
  # Check that name of template or project is valid, i.e. a template exists in
  # templates/tmuxp/ directory in direnv dotfiles.
  #
  # Globals:
  #   None
  #
  # Arguments:
  #   $1: Name of the template in direnv dotfiles to use.
  #
  # Output:
  #   Log error if any.
  #
  # Returns:
  #   1: If name is not valid
  #   0: If name is valid
  #
  # """
  local source_filename=$1
  local template_dir="${XDG_CONFIG_DIR:-${HOME}/.config}/direnv/templates/tmuxp"
  if ! [[ -f "${template_dir}/${source_filename}.yaml" ]]
  then
    direnv_log "ERROR" "Name ${source_filename} for template or project is not valid."
    direnv_log "ERROR" "Valid values are:"
    for i_file in "${template_dir}/"*.yaml
    do
      direnv_log "ERROR" "  - **$(basename "${i_file%%.yaml}")**."
    done
    return 1
  fi
}

check_mutually_exclusive_var()
{
  # """Check if mutually exclusive variable are not set in .envrc.ini
  #
  # Globals:
  #   None
  #
  # Arguments:
  #   None
  #
  # Output:
  #   Error log if any
  #
  # Returns:
  #   1: If mutually exclusive variables are set.
  #   0: If mutually exclusive variables are not set.
  #
  # """
  if [[ -n "${tmuxp_project}" ]] && [[ -n "${tmuxp_template}" ]]
  then
    direnv_log "ERROR" \
      "Option **'tmuxp_project'** and **'tmuxp_template'** are mutually exclusive."
    direnv_log "ERROR" \
      "Please review your **'.envrc.ini'** file"
    return 1
  elif [[ -z "${tmuxp_project}" ]] && [[ -z "${tmuxp_template}" ]]
  then
    tmuxp_template="default"
  fi
}

setup_tmuxp_config()
{
  # """Install tmuxp configuration from templates and needed symlinks
  #
  # Globals:
  #   None
  #
  # Arguments:
  #   $1: type of configuration to use (template or project)
  #
  # Output:
  #   Error and Info log and configuration files.
  #
  # Returns:
  #   None
  #
  # """
  local config_type="$1"
  local template_dir="${XDG_CONFIG_DIR:-${HOME}/.config}/direnv/templates/tmuxp"
  local filename=""

  if ! [[ -d "${tmuxp_configdir}" ]]
  then
    direnv_log "INFO" "Creating directory **${tmuxp_configdir}**."
    mkdir -p "${tmuxp_configdir}"
  fi

  if [[ "${config_type}" == "project" ]]
  then
    filename="${tmuxp_project}"
    direnv_log "INFO" "Installing project file **${filename}** in ${tmuxp_configdir}."
    cp "${template_dir}/${filename}.yaml" "${tmuxp_configdir}/${filename}.yaml"
  elif [[ "${config_type}" == "template" ]]
  then
    filename="${tmuxp_session_name}"
    direnv_log "INFO" "Installing project file **${filename}** in ${tmuxp_configdir}."
    sed \
      -e "s|^session_name: .*$|session_name: ${tmuxp_session_name}|g" \
      -e "s|^start_directory: .*$|start_directory: ${DIRENV_ROOT/${HOME}/\~}|g" \
      "${template_dir}/${tmuxp_template}.yaml" \
      > "${tmuxp_configdir}/${filename}.yaml"
  fi
}

process_tmuxp()
{
  # """Mainly process tmuxp configuration and load tmuxp configuration
  #
  # Globals:
  #   None
  #
  # Arguments:
  #   $1: Name of the tmux session
  #   $2: Name of the file template to use
  #
  # Output:
  #   Error and Info log and configuration files.
  #
  # Returns:
  #   None
  #
  # """
  local session_name=$2
  local filename=$1
  if ! [[ -f "${tmuxp_configdir}/${session_name}.yaml" ]]
  then
    check_source_exist "${filename}" || return 1
    if [[ -n "${tmuxp_project}" ]]
    then
      setup_tmuxp_config "project"
    else
      setup_tmuxp_config "template"
    fi
  fi
  if ! [[ -f "${DIRENV_ROOT}/.tmuxp.yml" ]]
  then
    direnv_log "INFO" "Create symlink to ${DIRENV_ROOT/${HOME/\~}}"
    ln -s "${tmuxp_configdir}/${session_name}.yaml" "${DIRENV_ROOT}/.tmuxp.yml"
  fi
  if ! tmux ls &> /dev/null || ! tmux ls | grep "^${tmuxp_session_name}:" -q &> /dev/null
  then
    direnv_log "INFO" "Starting tmux session **'${tmuxp_session_name}'**."
    if [[ -n "${tmuxp_project}" ]]
    then
      tmuxp_start_directory=${DIRENV_ROOT} tmuxp load . -d -s "${tmuxp_session_name}"
#    elif [[ -n "${tmuxp_template}" ]]
#    then
#      tmuxp load . -d -s "${tmuxp_session_name}"
    fi
  else
    direnv_log "INFO" "Tmux session **'${tmuxp_session_name}'** already started."
  fi
}


tmuxp_config()
{
  # """Setup tmuxp config file if needed and start a tmux session
  #
  # If file does not exists in `${TMUXP_CONFIGDIR}`, will create it based
  # on variable set in `.envrc.ini`.
  #
  # Then, depending on the value of variable `tmuxp_*` in `.envrc.ini`
  # will either:
  #
  #   - Create a new file for the project and create a symlink in the
  #     `${DIRENV_ROOT}` based on template and start a tmux session
  #   - Create a symlink in the `${DIRENV_ROOT}` based on template and
  #     start a tmux session
  #
  # Globals:
  #   DIRENV_ROOT
  #   DIRENV_TEMPLATE_FOLDER
  #
  # Arguments:
  #   None
  #
  # Output:
  #   None
  #
  # Returns:
  #   1 if something went wrong
  #   0 if the module is correctly loaded
  #
  # """
  #   - SC2154: Variable is referenced but not assigned
  # shellcheck disable=SC2154
  local tmuxp_configdir="${tmuxp_config[TMUXP_CONFIGDIR]:=${HOME}/.config/tmuxp}"
  local tmuxp_session_name="${tmuxp_config[tmuxp_session_name]:=$(basename "${DIRENV_ROOT}")}"
  local tmuxp_project="${tmuxp_config[tmuxp_project]:=""}"
  local tmuxp_template="${tmuxp_config[tmuxp_template]:=""}"

  check_mutually_exclusive_var || return 1

  if [[ -n "${tmuxp_project}" ]]
  then
    process_tmuxp "${tmuxp_project}" "${tmuxp_project}"
  elif [[ -n "${tmuxp_template}" ]]
  then
    process_tmuxp "${tmuxp_template}" "${tmuxp_session_name}"
  fi
  if [[ -z "${TMUX}" ]]
  then
    direnv_log "INFO" "To attach, run **'tmux attach -t ${tmuxp_session_name}'**."
  else
    direnv_log "INFO" "To attach, run **'tmux switch-client -t ${tmuxp_session_name}'**."
  fi
  return 0
}

deactivate_tmuxp_config()
{
  # """Unset exported variables for tmuxp_config module
  #
  # Unset `TMUXP_CONFIGDIR` variable previously exported.
  #
  # Globals:
  #   TMUXP_CONFIGDIR
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

  unset TMUXP_CONFIGDIR
}

# ------------------------------------------------------------------------------
# VIM MODELINE
# vim: ft=bash: foldmethod=indent
# ------------------------------------------------------------------------------
