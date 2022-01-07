---
hide:
  - toc # Hide toc pane
---
# Installation of a directory environment

First thing to do is install required source code into the direnv configuration
folder, by default `~/.config/direnv`.

To do so, simply clone the repo in your `~/.config` folder:

```bash
cd ~/.config
git clone {{ git_platform.url }}{{ direnv.git_slug_with_namespace }}
```

And that is all. Indeed, this will create a direnv "configuration" file
`~/.config/direnv/direnvrc` which will be sourced by direnv allowing you to use
an `.envrc.ini` configuration file to ease the use of direnv template throug
modules.

You can now see how to [configure][configure] and [activate][activate] a
directory environment using scripts provided by this repo.

[configure]: configuration.md
[activate]: activation.md
