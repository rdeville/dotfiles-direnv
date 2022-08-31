# tmuxp_config
Export tmuxp var and/or set `tmuxp.yaml` file to start tmux session

## Description


If TMUXP_CONFIGDIR is set in `.envrc.ini`, export it to define where to
store tmuxp configuration per directory.

Then depending on variables set in modules, will either use an existing
tmuxp project or copy an existing template for the directory.

Finally, this will start a tmux session with tmuxp in detached state.

Parameters in `.envrc.ini` are:

<center>

| Name                    | Description                                                                                     |
| :---------------------- | :----------------------------------------------------------------------------------             |
| `TMUXP_CONFIGDIR`       | Root directory location where to look/store tmuxp configurations.                               |
| `tmuxp_session_name`    | (optional) Name of the tmux session (default set to dirname).                                   |
| `tmuxp_template`        | (optional) Name of the tmuxp configuration template to copy (default set to default)[^1]        |
| `tmuxp_project`         | (optional) Specify the name of the tmuxp file and the tmux session (default set to default)[^1] |

</center>

[^1]:
    `tmuxp_template` and `tmuxp_project` are mutually exclusive as
    the first will make a copy of the template while the later will use
    (ERB)[https://github.com/tmuxp/tmuxp#erb].

## Parameters

### `TMUXP_CONFIGDIR`

Export a environment variable to specify to tmuxp where to look for
tmuxp session configuration files. Default set to
`XDG_CONFIG_DIR/tmuxp`.

### `tmuxp_session_name`

Define the name of the tmux session, default set to dirname.

### `tmuxp_template`

**Mutually exclusive with `tmuxp_project`**

Define the tmuxp template to use. This will copy the file
`${TMUXP_CONFIGDIR}/${tmuxp_template}.yaml` to
`${TMUXP_CONFIGDIR}/${tmuxp_session_name}.yaml` and will create
a symlink to it at `${DIRENV_ROOT}`.

If file `${TMUXP_CONFIGDIR}/${tmuxp_template}.yaml` does not
exists yet, it will be copied from
`templates/tmuxp/${tmuxp_template}.yaml`.

If `templates/tmuxp/${tmuxp_template}.yaml` does not exists an
error will be print and nothing related to tmuxp module will be done.

### `tmuxp_project`

**Mutually exclusive with `tmuxp_template`**

Define the tmuxp project to use. This will use the file
`${TMUXP_CONFIGDIR}/${tmuxp_project}.yaml` to start a session
based on the project file and will create a symlink to it at
`${DIRENV_ROOT}`.

If file `${TMUXP_CONFIGDIR}/${tmuxp_template}.yaml` does not
exists yet, it will be copied from
`templates/tmuxp/${tmuxp_template}.yaml`.

If `templates/tmuxp/${tmuxp_template}.yaml` does not exists an
error will be print and nothing related to tmuxp module will be done.

## `.envrc.ini` example

Corresponding entry in `.envrc.ini.template` are:

```ini
# tmuxp module
# ------------------------------------------------------------------------------
# Start a tmux session from tmuxp config in detached states
[tmuxp_config]
# Location where tmuxp file are stored
# TMUXP_CONFIGDIR=${HOME}/.config/tmuxp/
# Name of the session
tmuxp_session_name=cmd: dirname ${DIRENV_ROOT}
# Template to use (copy and symlink)
tmuxp_template=default
# Project to use (run an instance)
#tmuxp_project=default
```
