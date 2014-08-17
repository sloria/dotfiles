dotfiles
========

[sloria's dotfiles](https://github.com/sloria/dotfiles), rewritten as Ansible roles. Will eventually support MacOSX, Ubuntu, and Red Hat platforms.

a few neat features
-------------------

- zsh configured with [prezto](https://github.com/sorin-ionescu/prezto).
- nice fonts for the terminal and coding.
- iterm2 themes.
- anaconda python
- a tmux.conf that's pretty neat
- vim with Vundle for plugin management. All configuration in a single file .vimrc
- pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.

prerequisites (install these first)
-----------------------------------

- ansible >= 1.6
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

**IMPORTANT**: Change `group_vars/local` to your liking.

Run the installation script.

```bash
$ ./bin/dot
```

updating
--------

Once you have the dotfiles installed you can run the following command to rerun the ansible playbook:

```bash
$ dot
```

To update the dotfiles repo:

```bash
$ cd ~/dotfiles
$ git pull
```

commands
--------

There are three main commands in the `bin` directory for setting up and updating development environments:

- `dot`: sets up local environment.
- `dot-remote`: sets up remote environments.
- `vdot`: sets up vagrant environments.

special files
-------------

All configuration is done in `~/dotfiles`. Each role may contain (in addition to the typical ansible directories and files) a number of special files

- **role/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.

notes
-----

**zsh on Mac OSX**

In order for zsh to work on OSX, you may need to add `/usr/local/bin/zsh` to your `/etc/shells`


`/etc/shells` should look something like this:

```
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
# Add this
/usr/local/bin/zsh
```

**fonts**

To install fonts on OSX, simply drag the `.ttf` files in `misc/fonts` directory onto the Font Book application.

**python**

The `python` topic installs the [Anaconda Python distribution](https://store.continuum.io/cshop/anaconda/) using the [miniconda](http://conda.pydata.org/miniconda.html) installer. The installation is entirely self-contained, and lives at `~/miniconda`.

**iterm2 color themes**

To import an iterm theme from the `misc/iterm-themes` directory, open your iTerm2 preferences and go to your Profiles settings. In the color tab, click the Load preset dropdown and choose "Import".

setting up remote dev environments
----------------------------------

The `remote_env.yml` playbook can set up a minimal subset of these dotfiles on remote machines.

Just add the remote hosts you want to target under the `[remote]` group of the `hosts` file.

```
[remote]
123.456.789.111
```

Then copy the `group_vars/remote.example` to `group_vars/remote`

```bash
$ cp group_vars/remote.example group_vars/remote
```

Update the following variables in `group_vars/remote`:

- `dotfiles_user_home` : Your user home directory.
- `git_user` : Your git user name.
- `git_email` : Your git email.


Then run the `dot-remote` command.

```bash
$ ./bin/dot-remote
```

todo
----

- Full Debian and Red Hat support
- Add more options to `dot` script, e.g. for skipping tasks
