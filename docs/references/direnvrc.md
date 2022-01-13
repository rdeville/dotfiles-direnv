# direnvrc

Activate the directory environment

## Synopsis

source /path/to/activate_direnv

## Description

This script can be :

  - Sourced manually, like for python virtual environment, with the
    following command:
    ```
    source /path/to/.direnv/activate_direnv
    ```

  - Sourced automatically by `direnv` using file `.envrc`, see thee
    description in the header of file `.envrc`.

Script will parse the file `.envrc.ini`, build associative arrays for each
modules described in this file and load corresponding modules.

Finally, script will unset every temporary variable and methods that are not
required once directory environment is loaded to avoid spoiling shell
environment.



## activate_direnv()

 **Activate directory environment by loading modules**
 
 Check if script is called manuall or using `direnv`, set global variables
 related to directory environment folder (such as `DIRENV_ROOT`.)
 
 Call the method `parse_ini_file` to parse the file `.envrc.ini` to
 build associative arrays.
 
 From these associative arrays, ensure that module have not been modified, if
 modules have been modified, warn the user and safely exit. Else load
 corresponding modules.
 
 Finally, unset variables and methods not required once directory environment
 is loaded to avoid spoiling the user shell.


 **Output**

 - Log informations

 **Returns**

 - 0 if directory environment is correctly loaded
 - 1 if something when wrong during loading directory environment

### direnv_log()

> **Print debug message in colors depending on message severity on stderr**
> 
> Echo colored log depending on user provided message severity. Message
> severity are associated to following color output:
> 
>   - `DEBUG` print in the fifth colors of the terminal (usually magenta)
>   - `INFO` print in the second colors of the terminal (usually green)
>   - `WARNING` print in the third colors of the terminal (usually yellow)
>   - `ERROR` print in the third colors of the terminal (usually red)
> 
> If no message severity is provided, severity will automatically be set to
> INFO.
>
>
> **Arguments**
>
> | Arguments | Description |
> | :-------- | :---------- |
> | `$1` |  string, message severity or message content |
> | `$@` |  string, message content |
>
> **Output**
>
> - Log informations colored
>
>

### get_methods_list()

> **Parse file passed as argument to export list of methods**
> 
> Parse a file and return the list of "first-level" methods, i.e. methods
> which name is not idented. For instance, this metod is not a "first-level"
> method.
>
>
> **Arguments**
>
> | Arguments | Description |
> | :-------- | :---------- |
> | `$1` |  string, path to the file to parse |
>
> **Output**
>
> - Multiline string with all the "first-level" methods, one per line
>
> **Returns**
>
> - 0 if file has "first-level" methods
> - 1 if file does not have "first-level" methods
>
>

### unset_methods()

> **Unset methods if defined from list of methods provided as arguments**
> 
>
>
> **Arguments**
>
> | Arguments | Description |
> | :-------- | :---------- |
> | `$1` |  multiline string, list of methods to unset, one method per line |
>
> **Returns**
>
> - 0 if file has "first-level" methods
> - 1 if file does not have "first-level" methods
>
>

### unset_modules()

> **Unset modules from list of already loaded modules**
> 
> The process to unset modules is compose of two part:
> 
>   - Unset methods defined in the module
>   - Unset associative array related to this module
>
> **Globals**
>
> - `DIRENV_TEMP_FOLDER`
> - `DIRENVRC_MODULE_FOLDER`
>
>

### unset_all_methods_and_vars()

> **Unset all methods and variables set to load directory environment**
> 
> The process to unset all methods and variables is composed of two part:
> 
>   - Unset methods and variables defined by modules
>   - Unset methods defined by library scripts
>
> **Globals**
>
> - `DIRENV_ROOT`
> - `DIRENV_LOG_FOLDER`
> - `DIRENVRC_LIB_FOLDER`
> - `DIRENVRC_SRC_FOLDER`
> - `DIRENVRC_SHA1_FOLDER`
> - `DIRENVRC_MODULE_FOLDER`
> - `DIRENV_BIN_FOLDER`
> - `DIRENV_SHA1_FOLDER`
> - `DIRENV_TEMP_FOLDER`
> - `DIRENV_CONFIG_PATH`
> - `DIRENV_INI_SEP`
>
>

### set_direnv()

> **Set required global variables**
> 
> Check from which binary is called the script, depending on the way, set
> global variables that will be used by directory environment scripts if
> main scripts (i.e. `.envrc` and `activate_direnv`) have valid SH1.
>
> **Globals**
>
> - `DIRENV_ROOT`
> - `DIRENV_LOG_FOLDER`
> - `DIRENVRC_LIB_FOLDER`
> - `DIRENVRC_SRC_FOLDER`
> - `DIRENV_BIN_FOLDER`
> - `DIRENVRC_SHA1_FOLDER`
> - `DIRENV_TEMP_FOLDER`
> - `DIRENVRC_MODULE_FOLDER`
> - `DIRENV_CONFIG_PATH`
> - `DIRENV_INI_SEP`
>
> **Returns**
>
> - 0 if SHA1 of scripts are valid
> - 1 if SHA1 of scripts are not valid
>
>

### load_module()

> **Load specific module**
> 
> Check if module script exists, if not, print an error. Else, check if
> SHA1 of module script is valid, if not, print an error.
> If everything is correct, load the module.
>
> **Globals**
>
> - `DIRENV_TEMP_FOLDER`
> - `DIRENV_MODULE_FOLDER`
> - `DIRENV_CONFIG_PATH`
>
> **Arguments**
>
> | Arguments | Description |
> | :-------- | :---------- |
> | `$1` |  string, name of the module from `.envrc.ini` |
>
> **Output**
>
> - Log message if something went wrong
>
> **Returns**
>
> - 0 if module is correctly loaded
> - 1 if module can not be loaded
>
>

### load_config_file()

> **Load the configuration file**
> 
> Ensure the configuration file `.envrc.ini` exists. If not print and error
> and exit. Else ensure that `.envrc.ini has not been modified, if
> `.envrc.ini` has been modified, print an error and exit.
> If everything is right, parse the configuration file `.envrc.ini`
>
> **Globals**
>
> - `DIRENV_SHA1_FOLDER`
>
> **Arguments**
>
> | Arguments | Description |
> | :-------- | :---------- |
> | `$1` |  string, path to the configuration file |
>
> **Output**
>
> - Error message if something went wrong
>
> **Returns**
>
> - 0 if the configuration file has been loaded.
> - 1 if there is an error with the configuration file.
>
>

## # parse_ini_file()

 > **Parse a simple `.ini` file and stre values in associative arrays.**
 > 
 > Parse line by line a `.ini` file, if a section tag is encountered, create an
 > associative array from the name of the section and store each key, value
 > pair in this associative array.
 > 
 > For instances:
 > 
 > ```ini
 > [section_name]
 > # Comment
 > key_1 = foo
 > key_2 = bar
 > ```
 > 
 > Will result on the creation of the bash associative array `${section_name}`
 > with two key,value pair accessible as shown below:
 > 
 > ```bash
 > echo ${section_name[key_1]}
 > Will echo foo
 > echo ${section_name[key_2]}
 > Will echo bar
 > ```
 >
 > **Globals**
 >
 > - `DIRENV_INI_SEP`
 >
 > **Arguments**
 >
 > | Arguments | Description |
 > | :-------- | :---------- |
 > | `$0` |  string, path to the `.ini` config file to parse |
 >
 >

##  # parse_ini_section()

  > **Parse a simple `.ini` file and stre values in associative arrays.**
  > 
  > Parse line by line a `.ini` file, if a section tag is encountered, create an
  > associative array from the name of the section and store each key, value
  > pair in this associative array.
  > Space ` ` in section name will be replaced by underscore `_`.
  > 
  > For instances:
  > 
  > ```ini
  > [section name]
  > # Comment
  > key_1 = foo
  > key_2 = bar
  > ```
  > 
  > Will result on the creation of the bash associative array `${section_name}`
  > with two key,value pair accessible as shown below:
  > 
  > ```bash
  > echo ${section_name[key_1]}
  > # Will echo foo
  > echo ${section_name[key_2]}
  > # Will echo bar
  > ```
  >
  > **Globals**
  >
  > - `DIRENV_INI_SEP`
  >
  > **Arguments**
  >
  > | Arguments | Description |
  > | :-------- | :---------- |
  > | `$0` |  string, path to the `.ini` config file to parse |
  >
  >

##  # parse_ini_value()

  > **Parse line key, value provided as argument from an `.ini` file**
  > 
  > Parse a single line provided as first argument from an `.ini`, i.e. of the
  > following form:
  > 
  > ```ini
  > # This is a comment
  > key=value
  > key =value
  > key= value
  > key = value
  > ```
  > 
  > Others form are not supported !
  > Once the line is parse, if value start with `cmd:`, this means that value
  > is obtain from a command provided, execute the command to have the value.
  > store the pair key, value into the associative
  > array corresponding to the section provided as second argument.
  > 
  > If there already exist an entry for the key in the associative array, the
  > new value will be concatenate with the old value using `${DIRENV_INI_SEP}`
  > as separator to be able to easily split the string later in the
  > corresponding module.
  >
  > **Globals**
  >
  > - `DIRENV_INI_SEP`
  >
  > **Arguments**
  >
  > | Arguments | Description |
  > | :-------- | :---------- |
  > | `$1` |  string, line to parse |
  > | `$2` |  string, name of the module where key, value will be stored |
  >
  >

##  # parse_ini_line()

  > **Determine if a line define a section or a pair key, value**
  > 
  > Determine if line provided as argument define a section, then call method
  > `parse_ini_section`, else if line determine a pair key, value, call method
  > `parse_ini_value`.
  >
  >
  > **Arguments**
  >
  > | Arguments | Description |
  > | :-------- | :---------- |
  > | `$1` |  string, line to parse |
  > | `$2` |  string, name of the last section (i.e. module) parsed |
  >
  >

### deactivate_modules()

> **Deactivate already module**
> 
> Methods called when initialization of directory environment went wrong.
> For each already loaded modules, i.e. modules listed in
> ${DIRENV_TEMP_FOLDER}/.loaded_modules, call the deactivate method of the
> module.
> Finally, remove the file ${DIRENV_TEMP_FOLDER}/.loaded_modules.
>
> **Globals**
>
> - `DIRENV_MODULE_FOLDER`
> - `DIRENV_TEMP_FOLDER`
>
> **Arguments**
>
> | Arguments | Description |
> | :-------- | :---------- |
> | `$1` |  string, name of the module from `.envrc.ini` |
>
> **Output**
>
> - Log message if something went wrong
>
> **Returns**
>
> - 0 if module is correctly loaded
> - 1 if module can not be loaded
>
>

### safe_exit()

> **Safely exit the activation of directory environment in case of error**
> 
> Safely exit the activate of the directory environment if something went
> wrong during the initilization. This is done by deactivating modules, then
> unset all methods and variables.
>
>
> **Output**
>
> - Log message telling user an error occurs
>
> **Returns**
>
> - 1 in any case to indicate an error occurs
>
>
