---
hide:
  - navigation # Hide navigation
  - toc        # Hide table of contents
---

<!-- markdownlint-disable MD041 MD002 -->
{% set curr_repo=subs("direnv") %}

<!-- BEGIN MKDOCS TEMPLATE -->
<!--
WARNING, DO NOT UPDATE CONTENT BETWEEN MKDOCS TEMPLATE TAG !
Modified content will be overwritten when updating
-->

<div align="center">

  <!-- Project Title -->
  <a href="{{ git_platform.url }}{{ curr_repo.git_slug_with_namespace }}">
    <img src="{{ curr_repo.logo }}" width="200px">
    <h1>{{ curr_repo.name }}</h1>
  </a>

<hr>

{{ to_html(curr_repo.desc) }}

<hr>

  <b>
IMPORTANT !<br>

Main repo is on
<a href="{{ git_platform.url }}{{ curr_repo.git_slug_with_namespace }}">
  {{ git_platform.name }} - {{ curr_repo.git_name_with_namespace }}</a>.<br>
On other online git platforms, they are just mirrors of the main repo.<br>
Any issues, pull/merge requests, etc., might not be considered on those other
platforms.
  </b>

</div>

<!-- END MKDOCS TEMPLATE -->

## Introduction

This repo aims to help managing directory environment uniformly accross multiple
project. Management of directory environment (i.e. activation and deactivation)
are done automatically using [`direnv`][direnv].

### What is a directory environment ?

What we call a directory environment is a set of environment variables, binary,
scripts, etc., that should only be configured when working on a specific
project (i.e. in a specific folder and its subfolder).

For instance, if you use python virtualenv and OpenStack. Usually, when
starting to work, you often may enter the following command:

```bash
# Load OpenStack project variable
source openrc.sh
# Activate python virtual environment
source .venv/bin/activate
```

This will setup OpenStack related variable and Python Virtual environment
related variable as well as the method `deactivate` to deactivate the python
virtual environment.

Both of these are directory related process, usually you do not want these values
to be set when on another directory.

So to conclude this description, basically this repo will help you to setup your
directory to:

  - Automate these command to setup environment variable and methods when
    entering directories in which you want these varaible set
  - Automate unsetting these variables and methods when leaving the directory.

This is achieve automatically using [`direnv`][direnv]. [`direnv`][direnv] is an
extension for your shell. It augments existing shells with a new feature that
can load and unload environment variables depending on the current directory.

In other terms, if a script `.envrc` is present in a folder and allowed for
`direnv`, it will automatically be executed when entering the folder. When
leaving the folder any exported variables will be automatically unloaded.

### Why this repo since there is [`direnv`][direnv] ?

Since some times now, I use [`direnv`][direnv] to manage my directory environment.
Nevertheless, I was tired to always rewrite or copy/paste the same base scripts,
then adapt them for each of my working directory. This repo is here to help
managing the directory environment script in a homogeneous manner. Now, I do not
need to rewrite or copy/paste the base scripts. All of my repos have the same
scripts (i.e. modules) and I configure them using a `.envrc.ini` file.

## Quickstart

To use this repo, simply clone it in your direnv configuration folder, usually
in `~/.config/direnv`.

```bash
cd ~/.config
git clone {{ git_platform.url }}{{ direnv.git_slug_with_namespace }}
```

Then got the the folder where you want to create a directory environment and
create a basic `.envrc` file with the following content:

```bash
#!/usr/bin/env bash

# Call main method defined in ~/.config/direnv/direnvrc
activate_direnv

```

Then copy `~/.config/direnv/templates/envrc.template.ini` next to `.envrc`.

```bash
cp ~/.config/direnv/templates/envrc.template.ini .envrc.ini
```

Now, see [modules][modules] documentation to choose which module you want as
well as their configuration. Then, update `.envrc.ini` configuration file
accordingly with your favorite editor (`vim` here as example).

```bash
vim .envrc.ini
```

Finally, activate the directory environment.

```bash
# If you are using `direnv`, you can allow it for the current directory
direnv allow
```

This will parse your `.envrc.ini` and load modules accordingly.

Once you have finish working, your directory environment will automatically be
unload when leaving the directory.

See [Setup directory environment][setup_directory_environment] for a more
complete usage description.

[modules]: modules/index.md
[setup_directory_environment]: ./setup/index.md

<!-- URL used in mulitple section -->
[direnv]: https://direnv.net
