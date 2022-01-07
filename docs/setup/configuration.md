---
hide:
  - toc # Hide toc pane
---
# Configuration of directory environment

Now that base scripts are installed, you will just need to create a basic
`.envrc` script and a `.envrc.ini` file in the directory for which you want to
create a directory environment.

A example of such file with all modules is provided in
`~/.config/direnv/templates` (if you cloned the repo in `~/.config/direnv`).
You can simply copy/paste it with the following command:

```bash
# Copy the example of `.envrc` and `.envrc.ini` provided
cp ~/.config/direnv/templates/envrc.template .envrc
cp ~/.config/direnv/templates/envrc.ini.template .envrc.ini
```

You do not need to modify the file `.envrc`. But you **must update values in
`.envrc.ini`**. Indeed, most values in the example file are simply dummy values.
In order to properly configure your `.envrc.ini`, first check [available
modules][modules] to know which value to set for each module.

Some last important things that can be usefull when setting up values.

  * For each modules, they have list of variable you can set. Variables in
    UPPERCASE are variable that are exported by the module, i.e. these variables
    will be accessible with `echo ${VAR_NAME}` or will be shown when using `env`
    command, once the directory environment is activated. Variables in lowercase
    are not exported and are only used by the module.

    ??? example "Example of UPPERCASE and lowercase variable in `.envrc.ini`"

        From below example, variable `ANSIBLE_CONFIG` will be exported (use by
        ansible) while variable `inventory` will not be exported but will be
        used by module `ansible` when generating the `ansible.cfg` file.

        ```dosini
        # Ansible module
        # ------------------------------------------------------------------------------
        # Set ansible environment variable
        [ansible]
        # Choose the default configuration for the first initialisation
        default_config="config_name_1"

        [ansible:config_name_1]
        # Set the path to ansible configuration file. If this file does not exists, it
        # will be created from template in .direnv/templates/ansible.cfg.template
        ANSIBLE_CONFIG="${DIRENV_ROOT}/${OS_PROJECT_NAME}.ansible.cfg"
        # Path to inventory file or folder
        inventory="${DIRENV_ROOT}/inventory"
        ```

  * If you plan to also version your `.envrc.ini` or simply if you do not want
    to store some information (like passwords) in plain text, every values in
    your `.envrc.ini` can be set to catch output of specific command. In order
    to do so, you must start the value with `cmd: ` followed by the command that
    output the value you want to set.

    ??? example "Use of `cmd:` in `.envrc.ini`"

        Below is a short example to setup a value obtained from a command.

        ```dosini
        # Assuming you store the value in the file /tmp/my_password
        password=cmd: cat /tmp/my_password
        # When `.envrc.ini` will be parsed, the value of password will be
        # computed within the module. This allow to avoid storing password in
        # plain text in `.envrc.ini`
        ```

  * Modules are loaded in the order provided in the `.envrc.ini`. Below are some
    example.

    ??? example "Load module `molecule` first then load the module `ansible`"

        ```dosini
        # Molecule module
        # ------------------------------------------------------------------------
        [molecule]
        . . .

        # Ansible module
        # ------------------------------------------------------------------------
        [ansible]
        . . .
        ```

    ??? example "Load module `ansible` first then load the module `molecule`"

        ```dosini
        # Ansible module
        # ------------------------------------------------------------------------
        [ansible]
        . . .

        # Molecule module
        # ------------------------------------------------------------------------
        [molecule]
        . . .
        ```

    This can be seen as not usefull, but read the next point.

  * Values in `.envrc.ini` can use variables exported from previously loaded
    module. In order to do so, variables **must** be called with the following
    syntax `${VAR_NAME}`. This also apply to the variable `${DIRENV_ROOT}` which
    specify the absolute path to the directory which host the directory
    environment configuration files.

    ??? example "Use of exported variables from previously loaded module"

        In the below example, module `openstack` is loaded first, so variable
        `OS_PROJECT_NAME` is exported once the module is loaded. Which is then
        accessible by module `ansible`.

        !!! important
            If module `openstack` is below module `ansible` in ``.envrc.ini`,
            then this **will not work**.

        ```dosini
        # Openstack module
        # ------------------------------------------------------------------------------
        # Manage openstack environment variable. Main section [openstack] have only one
        # parameter `default` to define default openstack project configuration name.
        # Use section of the form [openstack:project_config_name_1] to define variable
        # per project configuration name.
        # **REMARK**: VALUE OF `default` MUST BE THE SAME VALUE OF A SUBSECTION AS SHOWN
        # BELOW:
        # ```
        # [openstack]
        # default=project_config_name_1
        #
        # [openstack:project_config_name_1]
        # OS_AUTH_URL=https://test.com
        # . . .
        # ```
        [openstack]
        # Default project configuration name when activating the direnv for the first
        # time
        # NO DEFAULT VALUE
        default=project_config_name_1

        # Configuration for each openstack project
        [openstack:project_config_name_1]
        # Value of openstack variable OS_AUTH_URL in openrc.sh
        OS_AUTH_URL=https://test.com
        # Value of openstack variable OS_PROJECT_ID in openrc.sh
        OS_PROJECT_ID=1234
        # Value of openstack variable OS_PROJECT_NAME in openrc.sh
        OS_PROJECT_NAME=project_name_1
        # Value of openstack variable OS_USERNAME in openrc.sh
        OS_USERNAME=username
        # Value of openstack variable OS_PASSWORD in openrc.sh, to avoid setup a value
        # in clear text, as for any other value in this ini file, start the value with
        # `cmd:` to tell the parser that value will be obtain by executing the command
        # specified after `¢md:`. In the example below, parser will execute command `echo
        # "foo", so value of OS_PASSWORD will be `foo`
        OS_PASSWORD=cmd:echo "foo"
        # Value of openstack variable OS_INTERFACE in openrc.sh
        OS_INTERFACE=interface
        # Value of openstack variable OS_REGION_NAME in openrc.sh
        OS_REGION_NAME=region_name
        # Value of openstack variable OS_IDENTITY_API_VERSION in openrc.sh
        OS_IDENTITY_API_VERSION=3
        # Value of openstack variable OS_USER_DOMAIN_NAME in openrc.sh
        OS_USER_DOMAIN_NAME=domain_name

        # Ansible module
        # ------------------------------------------------------------------------------
        # Set ansible environment variable
        [ansible]
        # Choose the default configuration for the first initialisation
        default_config="config_name_1"

        [ansible:config_name_1]
        # Set the path to ansible configuration file. If this file does not exists, it
        # will be created from template in .direnv/templates/ansible.cfg.template
        ANSIBLE_CONFIG="${DIRENV_ROOT}/${OS_PROJECT_NAME}.ansible.cfg"
        # Path to inventory file or folder
        inventory="${DIRENV_ROOT}/inventory"
        ```

[modules]: ../modules/index.md
