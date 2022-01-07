# taskwarrior
Setup taskwarrior variable to ease use of taskwarrior

## Description

Export some required variable used by the script. Finally ensure that
exported variables are valid, i.e. the taskwarrior database can be
unlocked using taskwarrior keyfile.

Parameters in `.envrc.ini` are:

<center>

| Name                 | Description                                           |
| :-----------------   | :---------------------------------------------------- |
| `TASKWARRIOR_TASKRC` | Absolute path to a taskwarrior .taskrc config file  |

</center>

## Parameters

### `TASKWARRIOR_TASKRC`

Absolute path to a taskwarrior config file database, you can use `~`,
`${HOME}` or even `${DIRENV_ROOT}` to define path relatively.

## `.envrc.ini` example

Corresponding entry in `.envrc.ini.template` are:

```ini
# taskwarrior module
# ------------------------------------------------------------------------------
# Set taskwarrior environment variable
[taskwarrior]
# Specify the path to the taskwarrior config file
TASKWARRIOR_TASKRC=${DIRENV_ROOT}/.taskrc
```
