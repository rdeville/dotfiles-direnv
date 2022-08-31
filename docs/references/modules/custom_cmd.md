# custom_cmd.sh

Export arbitrary variables

## Description

Simply execute list of custom cmd

Parameters in `.envrc.ini` are:

<center>

| Name        | Description                              |
| :---------- | :----------------------------            |
| `CMD`       | Commands to execute                      |

</center>

## Parameters

### `CMD`

Command to execute

## `.envrc.ini` example

Corresponding entry in `.envrc.ini.template` are:

```ini
# Custom command module
# ------------------------------------------------------------------------------
# Execute arbitrary command
[custom_cmd]
# Specify command to execute, variable name does not matter.
CMD_NAME="echo 'value'"
CMD_ANOTHER_NAME="echo 'value'"
```



## custom_cmd()

 **Custom command**
 
 Execute command


 **Output**

 - Log information

 **Returns**

 - 1 if a command failed
 - 0 if everything is right and database can be unlocked

## deactivate_export_var()

 **Do nothing as there is nothing to do**
 
