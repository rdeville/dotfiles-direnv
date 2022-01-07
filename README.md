<!-- markdownlint-disable MD041 MD002 -->
<div align="center" style="text-align: center;">

  <!-- Project Title -->
  <a href="https://framagit.org/rdeville.public/my_dotfiles/direnv">
    <img src="docs/assets/img/meta/direnv_logo.png" width="100px">
    <h1>Direnv</h1>
  </a>

  <!-- Project Badges -->
  ![License][license_badge]
  [![Build Status][build_status_badge]][build_status]

--------------------------------------------------------------------------------

Dotfiles to setup common directory environment management per project using
[`direnv`](https://direnv.net) uniformly for all my projects.

--------------------------------------------------------------------------------

  <b>
IMPORTANT !

Main repo is on [ Framagit][repo_url].<br>
On other online git platforms, they are just mirror of the main repo.<br>
Any issues, pull/merge requests, etc., might not be considered on those other
platforms.
  </b>
</div>

--------------------------------------------------------------------------------

[repo_url]: https://framagit.org/rdeville.public/my_dotfiles/direnv
[license_badge]: https://img.shields.io/badge/License-MIT%2FBeer%20Ware-blue?style=flat-square&logo=open-source-initiative
[build_status_badge]: https://framagit.org/rdeville.public/my_dotfiles/direnv/badges/master/pipeline.svg?style=flat-square&logo=appveyor
[build_status]: https://framagit.org/rdeville.public/my_dotfiles/direnv/commits/master

## Table of Content

  * [Introduction](#introduction)
  * [Project Documentation](#project-documentation)

## Introduction

This repo aims to help managing directory environment uniformly accross multiple
project by defining common configuration for [`direnv`][direnv].

**What is a directory environment ?**

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

Both of these are directory related process, usually you do not want these
values to be set when on another directory.

So to conclude this description, basically this repo will help you to setup your
directory to:

  * Automate these command to setup environment variable and methods when
    entering directories in which you want these varaible set
  * Automate unsetting these variables and methods when leaving the directory.

This can be [direnv][direnv]. [`direnv`][direnv] is an extension for your shell.
It augments existing shells with a new feature that can load and unload
environment variables depending on the current directory.

In other terms, if a script `.envrc` is present in a folder and allowed for
`direnv`, it will automatically be executed when entering the folder. When
leaving the folder any exported variables will be automatically unloaded.

The complete description of this repos, as well as many more information such as
use of modules, description of the configuration file, etc., is available on a
dedicated website, see [Direnv Template Online
Documentation][online_doc].

If [Direnv Template Online Documentation][online_doc] is not
accessible, you can render the online documentation locally on your computer,
see section [Render documentation locally](#render-documentation-locally)

**Why this repo since there is [direnv][direnv] ?**

Since some times now, I use [direnv][direnv] to manage my directory environment.
Nevertheless, I was tired to always rewrite or copy/paste the same base scripts,
then adapt them for each of my working directory. This repo is here to help
managing the directory environment script in a homogeneous manner. Now, I do not
need to rewrite or copy/paste the base scripts. All of my repos have the same
scripts (i.e. modules) and I configure them using a really simple `.envrc` and a
configuration `.envrc.ini` file.

[direnv]: https://direnv.net

<!-- BEGIN MKDOCS TEMPLATE -->
<!--
     WARNING, DO NOT UPDATE CONTENT BETWEEN MKDOCS TEMPLATE TAG !
     Modified content will be overwritten when updating
-->

## Project Documentation

The complete documentation of the project can be accessed via its [Online
Documentation][online_doc].

If, for any reason, the link to the [Online Documentation][online_doc] is
broken, you can generate its documention locally on your computer (since the
documentation is jointly stored within the repository).

To do so, you will need the following requirements:

  * Python >= 3.8
  * Pip3 with Python >= 3.8

First setup a temporary python virtual environment and activate it:

```bash
# Create the temporary virtual environment
python3 -m venv .temporary_venv
# Activate it
source .temporary_venv/bin/activate
```

Now, install required dependencies to render the documentation using
[mkdocs][mkdocs] in the python virtual environment:

```bash
pip3 install -r requirements.docs.txt
```

Now you can easily render the documentation using [mkdocs][mkdocs] through the
usage of the following command (some logs will be outputed to stdout):

```bash
# Assuming you are at the root of the repo
# If there is a `mkdocs.local.yml`
mkdocs serve -f mkdocs.local.yml
# If there is no `mkdocs.local.yml`, only `mkdocs.yml`
mkdocs serve
```

You can now browse the full documentation by visiting
[http://localhost:8000][localhost].

[localhost]: https://localhost:8000
[mkdocs]: https://www.mkdocs.org/

<!-- END MKDOCS TEMPLATE -->

[online_doc]: https://docs.romaindeville.fr/rdeville.public/my_dotfiles/direnv/index.html
