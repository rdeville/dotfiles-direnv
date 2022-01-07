# generate_module_docs.sh

Generate mkdocs documentation for each modules

## Synopsis


./generate_module_docs.sh

## Description


THIS SCRIPTS REQUIRES DIRECTORY ENVIRONMENT TO BE ACTIVATED.

For each script in modules folder, extract docstring describing the module
usage and write corresponding documentation to `docs/modules/` folder.



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

## generate_doc()

 **Extract modules docstring and write corresponding documentation**
 
   For each script in modules folder, extract docstring describing the module
   usage and write corresponding documentation to `docs/modules/` folder.

 **Globals**

 - `DIRENV_MODULE_FOLDER`
 - `DIRENV_ROOT`

## main()

 **Main method starting the generation of `.envrc.template.ini`**
 
 Ensure directory environment is loaded, then load libraries scripts and
 finally generate the modules documentations

 **Globals**

 - `DIRENV_ROOT`
