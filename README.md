<!-- markdownlint-disable MD041 MD002 -->
<div align="center" style="text-align: center;">

  <!-- Project Title -->
  <a href="https://framagit.org/rdeville.public/my_dotfiles/direnv">
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

Main repo is on [framagit.org][repo_url].<br>
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

## Introduction

This repo aims to store my direnv configuration to help managing directory
environment uniformly accross multiple project by defining common configuration
for [`direnv`][direnv].

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

This can be [direnv][direnv].

> [`direnv`][direnv] is an extension for your shell. It augments existing shells
> with a new feature that can load and unload environment variables depending on
> the current directory.

In other terms, if a script `.envrc` is present in a folder and allowed for
`direnv`, it will automatically be executed when entering the folder. When
leaving the folder any exported variables will be automatically unloaded.

[direnv]: https://direnv.net