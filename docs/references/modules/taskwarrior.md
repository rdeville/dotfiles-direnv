# taskwarrior.sh

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



## taskwarrior()

 **Export taskwarrior variable**
 
 Ensure that exported variables are valid, i.e. the taskwarrior database
 can be unlocked using taskwarrior keyfile.

 **Globals**

 - `TASKWARRIOR_TASKRC`

 **Output**

 - Log information

 **Returns**

 - 1 if required variables are not set or if database can not be unlocked
 - 0 if everything is right and database can be unlocked

### check_variable()

> **Ensure variables are defined**
> 
> Ensure the value provided as second argument is not null. First argument
> is the name of the variable associated with the value.
>
>
> **Arguments**
>
> | Arguments | Description |
> | :-------- | :---------- |
> | `$1` |  string, name of the variable to check |
> | `$2` |  string, value of the variable to check |
>
> **Output**
>
> - Error log when variable value is not set
>
> **Returns**
>
> - 1 if variable value is not set
> - 0 if variable value is set
>
>

## deactivate_taskwarrior()

 **Unset exported variables for taskwarrior module**
 
 Unset `TASKWARRIOR_*` variable previously exported.

 **Globals**

 - `TASKWARRIOR_DB`
 - `TASKWARRIOR_KEYFILE`
 - `TASKWARRIOR_NAME`
