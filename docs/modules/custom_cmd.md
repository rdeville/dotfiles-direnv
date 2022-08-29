# custom_cmd
Export arbitrary variables

## Description

Simply execute list of custom cmd

Parameters in `.envrc.ini` are:

<center>

| Name        | Description                              |
| :---------- | :----------------------------            |
| `CMD`  | Commands to execute |

</center>

## Parameters

### `CMD`

Command to execute

## `.envrc.ini` example

Corresponding entry in `.envrc.ini.template` are:

```ini
# export module
# ------------------------------------------------------------------------------
# Export arbitrary variables
[custom_cmd]
# Specify variable name and value to export
CMD_NAME="echo 'value'"
CMD_ANOTHER_NAME="echo 'value'"
```
