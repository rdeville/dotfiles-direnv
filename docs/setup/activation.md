# Activation of a directory environment

Once you have finished setting your `.envrc.ini` configuration file, you can now
activate your directory environment. The activation process will parse the
content of your `.envrc.ini` file and will load modules accordingly.

## Automatic activation

If you copied the template file `~/.config/direnv/templates/envrc.template` as
`.envrc` file in the directory for which you want setup a directory environment
and if you have correctly setup [`direnv`][direnv] you might have seen the
following message:

```text
direnv: error /path/to/.envrc is blocked. Run `direnv allow` to approve its content.
```

So to automate the activation of the directory environment, you just need to
type the following command:

```bash
direnv allow
```

If something went wrong, you will see output like:

```text
[ERROR] Error message to explain what happen.
```

In this case, please refers to section [Error during
activation][error_activation] below.

## Error during activation

During the activation of the directory environment, you might see output message
starting with `[ERROR]`.

Normally, you might see three types of error:

  * Module does not exists

    ```text
    [ERROR] Module module_name does not exists !
    [ERROR] Please review file /path/to/.envrc.ini to remove or comment it.
    ```

    This menas that you setup a wrong section module, i.e. `[module_name]` in
    your `.envrc.ini` file. Please review your `.envrc.ini` file, this might
    come from a typo error. Moreover, see [available modules][modules] to know
    which modules is available.

  * SHA1 error of a specific module

    ```text
    [ERROR] SHA1 of file `.direnv/modules/module_name.sh`  does not correspond to `.direnv/.sha1/modules/module_name.sh.sha1`.
    [ERROR] An error occurs while loading direnv
    ```

    This means the module specified has been modify. This is a security feature.

    Normally, [`direnv`][direnv] provide a security when file `.envrc` has been
    modify to avoid execution of malicious code. But usage of this project make
    change behaviour of [`direnv`][direnv] which may bypass security feature. As
    configuration of directory environment is done through  `.envrc.ini`, once
    directory environment activated, you may need to update `.envrc`, so once
    allowed, [`direnv`][direnv] will not know if it will execute malicious code.

    To tackle this issues, every files used by this project is provided with its
    SHA1 sum. So, when activating directory environment first things done is to
    ensure that these files as not been modified and so, avoid execution of
    malicious code.

    If you modify one of these files volontarily, you will need to update the
    corresponding SHA1 sum of the files you modified. To do so, please refer to
    the tutorial [Add direnv module][add_direnv_module]. And, even better, if
    you modify a files, this probably means that project currently lack a
    feature. Do not hesitate to contribute and submit a merge request to let the
    community make profit of your enhancement. In order to do so, please refers
    to the [Developers Guide][developers_guide]

  * SHA1 error of `.envrc.ini`

    ```text
    [ERROR] SHA1 of file `.envrc.ini`  does not correspond to `.direnv/.sha1/.envrc.ini.sha1`.
    [ERROR] If you modify /path/to/.envrc.ini.
    [ERROR] Please remove /path/to/.direnv/.sha1/.envrc.ini.sha1.
    [ERROR] And reactivate direnv.
    ```

    This means your `.envrc.ini` has been modified, probably by you. But if it
    is not the case, this project avoid malicious modification of your
    `.envrc.ini`.

    Indeed, as for files provided with this project, there is a protection
    mechanism. This project require a SHA1 sum of your `.envrc.ini`. This SHA1
    sum is stored in `.direnv/.sha1/.envrc.ini.sha1`.

    If this file does not exist, then the SHA1 sum of your `.envrc.ini` file
    will be computed and stored in `.direnv/.sha1/.envrc.ini.sha1`.

    If this file exists, then each time you will activate your directory
    environment, the SHA1 sum of your `.envrc.ini` will be checked against the
    value stored in `.direnv/.sha1/.envrc.ini.sha1`.

    If the value differs, then you will see this error. In this case, review the
    content of your `.envrc.ini`. If something seems wrong, then correct it in
    your `.envrc.ini`, else, if everything seems right for you, then you can
    simply delete `.direnv/.sha/.envrc.ini.sha1` and finally, you can activate
    your directory environment again.

## Deactivation

To deactivate your directory environment, you have nothing to do. The directory
environment will automatically be deactivated when leaving the directory.

[add_direnv_module]: ../tutorials/add_direnv_module.md
[error_activation]: activation.md#error-during-activation
[developers_guide]: {{ site_base_url }}/dev_guides/
[direnv]: https://direnv.net
[modules]: ../modules/index.md
