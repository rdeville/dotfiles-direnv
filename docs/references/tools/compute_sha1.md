# compute_sha1.sh

Recursively compute SHA1 sum of a list of files and folders

## Synopsis

./compute_sha1.sh

## Description

The script will compute SHA1 sum of every required files for directory
environment and store these SHA1 into the corresponding file in `.sha1`
folder with the same architecture.



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

## main()

 **Ensure directory environment is activated an run SHA1 sum computation**
 

 **Globals**

 - `DIRENV_ROOT`

 **Output**

 - Error informations

 **Returns**

 - 1 if directory environment is not activated
 - 0 if everything went right
