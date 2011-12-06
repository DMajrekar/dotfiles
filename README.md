# My Dotfiles

These have been based off the template used by Zach Holman (https://github.com/holman/dotfiles)

# Install

```sh
git clone git://github.com/DMajrekar/dotfiles.git
rake 
```

# Additions

Just add a directory for each type of command that needs to be added.

## Filename Structures

* *.symlink - will get symlined into ~ during install
* aliases.zsh - list of aliases that will be loaded into zsh
* *.plugin.zsh - functions that will be loaded into zsh

# Commands

```sh
reload! # will reload the zsh config
```

# Requrements

* rake for install
