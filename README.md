dotfiles
========

A port of [sloria's dotfiles](https://github.com/sloria/dotfiles) to a set of Ansible roles. Will eventually support MacOSX, Ubuntu, and Fedora platforms.

a few neat features
-------------------

- zsh configured with [prezto](https://github.com/sorin-ionescu/prezto).
- nice fonts for the terminal and coding.
- iterm2 themes.
- anaconda python
- a tmux.conf that's pretty neat
- vim with Vundle for plugin management. All configuration in a single file .vimrc
- pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.
Prerequisites

prerequisites (install these first)
-----------------------------------

- ansible
- homebrew (If on Mac OSX)
- git (homebrew installable on Mac OSX)


install
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

special files
-------------

All configuration is done in `~/dotfiles`. Each role may contain (in addition to the typical ansible directories and files) a number of special files

- **role/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.

notes
-----

**fonts**

To install fonts on OSX, simply drag the `.ttf` files onto the Font Book application.

**python**

The `python` topic installs the [Anaconda Python distribution](https://store.continuum.io/cshop/anaconda/) using the [miniconda](http://conda.pydata.org/miniconda.html) installer. The installation is entirely self-contained, and lives at `~/miniconda`.

**iterm2 color themes**

To import an iterm themes, open your iTerm2 preferences and go to your Profiles settings. In the color tab, click the Load preset dropdown and choose "Import".
