# generate_envrc_ini_template.sh

Generate template of `.envrc.ini` file from module documentation

## Synopsis


./generate_envrc_ini_template.sh

## Description


THIS SCRIPTS REQUIRES DIRECTORY ENVIRONMENT TO BE ACTIVATED.

For each module scripts in modules folder, extract `.envrc.ini` example in
the module docstring and generate file `templates/envrc.template.ini`.



## direnv_log()

 **Print debug message in colors depending on message severity on stderr**
 
 Echo colored log depending on user provided message severity. Message
 severity are associated to following color output:
 
   - `DEBUG` print in the fifth colors of the terminal (usually magenta)
   - `INFO` print in the second colors of the terminal (usually green)
   - `WARNING` print in the third colors of the terminal (usually yellow)
   - `ERROR` print in the third colors of the terminal (usually red)
 
 If no message severity is provided, severity will automatically be set to
 INFO.


 **Arguments**

 | Arguments | Description |
 | :-------- | :---------- |
 | `$1` |  string, message severity or message content |
 | `$@` |  string, message content |

 **Output**

 - Log informations colored

## generate_envrc_ini()

 **Extract `.envrc.ini` example of each module and write it in `templates/envrc.template.ini`.**
 
   For each module scripts in modules folder, extract `.envrc.ini` example in
   the module docstring and generate file `templates/envrc.template.ini`.

 **Globals**

 - `DIRENV_ROOT`

## main()

 **Main method starting the generation of `.envrc.template.ini`**
 
 Ensure directory environment is loaded, then load libraries scripts and
 finally generate the `.envrc.template.ini`.

 **Globals**

 - `DIRENV_ROOT`
