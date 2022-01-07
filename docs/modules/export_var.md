# export_var
Export arbitrary variables

## Description

Simply export list of arbitrary variables defined in module sections.

Parameters in `.envrc.ini` are:

<center>

| Name        | Description                              |
| :---------- | :----------------------------            |
| `VAR_NAME`  | Name and value of the variable to export |

</center>

## Parameters

### `VAR_NAME`

Name and value of the variable to export.

## `.envrc.ini` example

Corresponding entry in `.envrc.ini.template` are:

```ini
# export module
# ------------------------------------------------------------------------------
# Export arbitrary variables
[export_var]
# Specify variable name and value to export
VAR_NAME="value"
```
