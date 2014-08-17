dotfiles
========

A port of [sloria's dotfiles](https://github.com/sloria/dotfiles) to a set of Ansible roles. Will eventually support MacOSX, Ubuntu, and Fedora platforms.

Prerequisites

- ansible
- homebrew (If on Mac OSX)
- git

Install
-------

Clone the repo

```bash
# Replace git url with your fork if applicable
# NOTE: It is important that you clone to ~/dotfiles
$ git clone https://github.com/asmacdo/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
```

Copy local variables file.

```bash
$ cp group_vars/local.example group_vars/local
```

**IMPORTANT**: Change group_vars/local to your liking.

Run the installation script.

```bash
$ ./dot
```

Special Files
-------------

All configuration is done in `~/dotfiles`. Each role may contain (in addition to the typical ansible directories and files) a number of special files

- **role/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
