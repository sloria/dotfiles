# dotfiles

[sloria's dotfiles](https://github.com/sloria/dotfiles-old), rewritten as Ansible roles. Sets up my local and remote development environments with a single command.
Supports macOS and OrbStack VMs running Debian.

## a few neat features

- zsh configured with [prezto](https://github.com/sorin-ionescu/prezto).
- python managed with [uv](https://docs.astral.sh/uv/)
- neovim/[lazyvim](https://www.lazyvim.org/)
- pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.
- manages cross-platform packages and macOS-only packages
- useful git aliases
- idempotency, thanks to [Ansible](https://docs.ansible.com/projects/ansible/latest/index.html)
- optional support for provisioning [OrbStack](https://orbstack.dev/) VMs

## prerequisites

- homebrew (If on macOS) - **Install this first**
- git: `brew install git`
- ansible >= 1.6: `brew install ansible`

## install

- [Fork](https://github.com/sloria/dotfiles/fork) this repo.
- Clone your fork.

```console
# Replace git url with your fork
# NOTE: It is important that you clone to ~/dotfiles
git clone https://github.com/YOU/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

- Update the following variables in `group_vars/all.yaml` (at a minimum)
  - `git_name`: Your name, which will be attached to commit messages, e.g. "Steven Loria"
  - `git_email`: Your git email address.

### configure what gets installed

#### cross platform packages

Cross-platform utilities that get can be installed by package managers (homebrew, apt) go in `group_vars/all.yaml`. Edit `utilities_packages`:

```yaml
utilities_packages:
  - curl
  - wget
  # ...
```

#### macOS-only packages and apps

macOS-only packages to install with homebrew go in either
`group_vars/local.yaml` (for local installation) or `group_vars/remote.yaml` (for the mac mini). Edit `mac_homebrew_packages` and `mac_cask_packages`.

```yaml
mac_homebrew_packages:
  - wifi-password
  - qrtool
  # ...

mac_cask_packages:
  - 1password
  # ...
```

#### roles

roles encapsulate installation of tools as well as related shell scripts (for setting environment variables, aliases, functions, completion).

Add and edit roles in the `roles/` directory and their corresponding entry in `provision.yaml` as you see fit.

### run the install script

After configuring the packages you want, run `dot-local`, a shell script that thinly wraps `ansible run`.

```console
./bin/dot-local
```

## authenticating with github

You won't be able to push to repos until you authenticate with GitHub.
You can use `gh` for this, which should have been installed by `dot-bootstrap` above.

```console
gh auth login
gh auth setup-git
```

## updating your local environment

Once you have the dotfiles installed you can run the following command to rerun the ansible playbook:

```console
dot-local
```

You can optionally pass role names

```console
dot-local git python
```

## creating and provisioning OrbStack VMs

```console
dot-vm mybox
# Creates an debian VM called "mybox"
```

To SSH:

```console
ssh mybox
```

## updating your dotfiles repo

To keep your fork up to date with the `sloria` fork:

```
git remote add sloria https://github.com/sloria/dotfiles.git
git pull sloria master
```

## commands

There are three main commands in the `bin` directory for setting up and updating development environments:

- `dot-local`: sets up local environment
- `dot-remote`: sets up remote environment
- `dot-vm`: creates and provisions OrbStack VMs

## special files

All configuration is done in `~/dotfiles`. Each role may contain (in addition to the typical ansible directories and files) a number of special files

- **role/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.

## notes

**vscode**

Use built-in Settings Sync to sync VSCode settings.

**macOS keyboard settings**

There are a few keyboard customizations that must be done manually:

- System Settings > Keyboard > Turn "Key repeat rate" and "Delay until repeat" to their highest settings.

![Keyboard settings](https://github.com/user-attachments/assets/0c0e9ed6-3e5b-4996-b1e0-4aa4e9de3725 "Key repeat settings")

- System Settings > Keyboard > Keyboard Shortcuts > Modifier Keys > Change Caps Lock key to Control.

![Modifier keys](https://github.com/user-attachments/assets/79a883cd-9eec-472e-bdb6-0b4c2efeea9d)

**mac mini**

I also use this repo to configure my Mac Mini server which I have running in headless mode. My setup is documented in [docs/MAC_MINI.md](docs/MAC_MINI.md).

## troubleshooting

If you get an error about Xcode command-line tools, you may need to run

```
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

[homebrew]: http://brew.sh/
[homebrew-cask]: https://github.com/caskroom/homebrew-cask
[mas]: https://github.com/mas-cli/mas

## license

[MIT Licensed](http://sloria.mit-license.org/).
