# Modules

Modules are part of `direnv` which run tasks related to a specific
environment, for instance module `ansible` will only execute task related to
`ansible`, etc.

## List of exisitng modules

<center>

| Module Name | Description |
| :---------- | :---------- |
| [ansible](ansible.md) | Setup ansible configuration file and tree architecture |
| [custom_cmd](custom_cmd.md) | Export arbitrary variables |
| [export_var](export_var.md) | Export arbitrary variables |
| [go_management](go_management.md) | Export GO variables to install go modules locally |
| [keepass](keepass.md) | Setup keepass wrapper script and variable to ease use of keepassxc-cli |
| [kubernetes](kubernetes.md) | Export kubernetes variables |
| [openstack](openstack.md) | Export openstack variables for python openstackclient |
| [path_management](path_management.md) | Update `PATH` variable with user defined folder |
| [python_management](python_management.md) | Setup a complete python virtual environment |
| [taskwarrior](taskwarrior.md) | Setup taskwarrior variable to ease use of taskwarrior |
| [tmuxp_config](tmuxp_config.md) | Export tmuxp var and/or set `tmuxp.yaml` file to start tmux session |

</center>
