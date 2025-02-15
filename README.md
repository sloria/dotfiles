⚠ This branch is for setting up my mac mini. It's more stripped down than what I have on my main development machine.

## mac mini-specific setup

### first boot setup

- Skip iCloud configuration
- Don't enable FileVault so I can remotely start or reboot

### system settings

- System Settings / Network / Firewall - Enable
- System Settings / Energy / Prevent automatic sleeping with the display is off, Wake for network access, Start up automatically after network failure. These settings are enabled to ensure the device does not got to sleep
- System Settings / Accessibility / Display / Reduce motion, Reduce transparency - On
- System Settings / Appearance / Allow wallpaper tinting in windows - Off
- System Settings / General / Software Update / Automatic Updates - Download new updates when available, Install macOS updates, Install Security Responses and system files - On
- System Settings / Spotlight / Search results - Disable all options
- Manually remove all notification center widgets

### sharing settings

- System Settings / General / Sharing / Screen Sharing - On. This allows remote access to the device via the Screen Sharing app
- System Settings / General / Sharing / Content Caching - Storage, Clients / Devices using the same public IP address, use ony public IP address.
- System Settings / General / Sharing / Remote Login - On. This allows SSH while while using Tailscale

## misc

- Disable Bluetooth in Control Center
- Once the mac mini is connected to the router via ethernet, disable Wi-Fi in Conrol Center

### sources

- https://stealthpuppy.com/mac-mini-home-server/#first-boot-setup

---

# dotfiles

[sloria's dotfiles](https://github.com/sloria/dotfiles-old), rewritten as Ansible roles. Sets up a full local development environment with a **single command.**

Fully supports macOS. Red Hat and Debian support is good but not as complete.

## a few neat features

- zsh configured with [prezto](https://github.com/sorin-ionescu/prezto).
- nice fonts for the terminal and coding.
- python managed with [uv](https://docs.astral.sh/uv/)
- a tmux.conf that's pretty neat.
- vim with [vim-plug](https://github.com/junegunn/vim-plug) for plugin management. All configuration in a single file [.vimrc](https://github.com/sloria/dotfiles/blob/master/roles/vim/files/vimrc).
- pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.
- Mac packages installed with [homebrew][]. Mac apps installed with [homebrew-cask][] and [mas][].
- Useful git aliases

## prerequisites

- homebrew (If on macOS) - **Install this first**
- git: `brew install git`
- ansible >= 1.6: `brew install ansible`

## install

- [Fork](https://github.com/sloria/dotfiles/fork) this repo.
- Clone your fork.

```bash
# Replace git url with your fork
# NOTE: It is important that you clone to ~/dotfiles
git clone https://github.com/YOU/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

- Update the following variables in `group_vars/local` (at a minimum)
  - `full_name`: Your name, which will be attached to commit messages, e.g. "Steven Loria"
  - `git_user`: Your Github username.
  - `git_email`: Your git email address.
- Optional, but recommended: Update `group_vars/local` with the programs you want installed by [homebrew][], [homebrew-cask][], and npm.
  - `mac_homebrew_packages`: Utilities that don't get installed by the roles.
  - `mac_cask_packages`: Mac Apps you want installed with [homebrew-cask][].
- Edit `local_env.yml` as you see fit. Remove any roles you don't use. Edit roles that you do use.
- Run the installation script.

```bash
./bin/dot-bootstrap
```

## authenticating with github

You won't be able to push to repos until you authenticate with GitHub.
You can use `gh` for this, which should have been installed by `dot-bootstrap` above.

```
gh auth login
```

## updating your local environment

Once you have the dotfiles installed you can run the following command to rerun the ansible playbook:

```bash
dot-update
```

You can optionally pass role names

```bash
dot-update git python
```

## updating your dotfiles repo

To keep your fork up to date with the `sloria` fork:

```
git remote add sloria https://github.com/sloria/dotfiles.git
git pull sloria master
```

## commands

There are three main commands in the `bin` directory for setting up and updating development environments:

- `dot-bootstrap`: sets up local environment by executing all roles in `local_env.yml`.
- `dot-update`: updates local environment by executing all roles in `local_env.yml` except for the ones tagged with "bootstrap".

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

## what if I only want your vim?

First make sure you have a sane vim compiled. On macOS, the following will do:

```
brew install vim
```

The following commands will install vim-plug and download my `.vimrc`.

After backing up your `~/.vim` directory and `~/.vimrc`:

```
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vimrc https://raw.githubusercontent.com/sloria/dotfiles/master/roles/vim/files/vimrc
```

You will now be able to open vim and run `:PlugInstall` to install all plugins.

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
