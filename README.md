<!-- BEGIN DOTGIT-SYNC BLOCK MANAGED -->
# 👋 Welcome to dotgit-sync

<center>

[![Licenses: (MIT OR BEERWARE)][license_badge]][license_url]
[![Changelog][changelog_badge]][changelog_badge_url]
[![Build][build_badge]][build_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[build_badge]: https://framagit.org/rdeville-public/programs/dotgit-sync/badges/main/pipeline.svg
[build_badge_url]: https://framagit.org/rdeville-public/programs/dotgit-sync/-/commits/main
[release_badge]: https://framagit.org/rdeville-public/programs/dotgit-sync/-/badges/release.svg
[release_badge_url]: https://framagit.org/rdeville-public/programs/dotgit-sync/-/releases/
[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/programs/dotgit-sync/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

> Dotfiles to setup common directory environment management per project using [`direnv`](https://direnv.net) uniformly for all my projects.

---
<!-- BEGIN DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
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
<!-- END DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: https://framagit.org/rdeville-public/programs/dotgit-sync/-/issues
[contributing]: https://framagit.org/rdeville-public/programs/dotgit-sync/blob/main/CONTRIBUTING.md

## 👤 Maintainers

* 📧 [**Romain Deville** \<code@romaindeville.fr\>](mailto:code@romaindeville.fr)
  * Website: [https://romaindeville.fr](https://romaindeville.fr)
  * Github: [@rdeville](https://github.com/rdeville)
  * Gitlab: [@r.deville](https://gitlab.com/r.deville)
  * Framagit: [@rdeville](https://framagit.org/rdeville)

## 📝 License

Copyright © 2023 - 2024 [Romain Deville](code@romaindeville.fr)

This project is under following licenses (**OR**) :

* [MIT][main_license]
* [BEERWARE][beerware_license]

[main_license]: https://framagit.org/rdeville-public/programs/dotgit-sync/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/programs/dotgit-sync/blob/main/LICENSE.BEERWARE
<!-- END DOTGIT-SYNC BLOCK MANAGED -->
