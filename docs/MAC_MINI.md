# mac mini-specific setup

## first boot setup

- Skip iCloud configuration
- Enable FileVault. Save recovery key in password manager.
  NOTE: this requires running `sudo fdesetup authrestart` to restart.
  `sudo shutdown` **will not work**.

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
- System Settings / General / Sharing / Remote Login - On. This allows SSH while while using Tailscale

### ssh setup

Generate a new SSH keypair in 1password. Copy the public key and add it to ~/.ssh/authorized_keys on the mac mini.

```
vim ~/.ssh/authorized_keys
```

Then paste the public key as the first line.

Disable password authentication for SSH by creating a ssd_config.d file.

```
sudo vim /etc/ssh/sshd_config.d/disallow_password_auth.conf
```

```
PasswordAuthentication no
ChallengeResponseAuthentication no
StrictModes yes
```

### misc

- Disable Bluetooth in Control Center
- Once the mac mini is connected to via ethernet, disable Wi-Fi in Control Center

### sources

- https://stealthpuppy.com/mac-mini-home-server/#first-boot-setup

## bootstrapping the mac mini environment

```
./bin/dot-remote
```

## updating roles

Run the following locally.

```
dot-remote
```

to update a specific role

```
dot-remote python
```

## upgrading packages, docker images, etc.

ssh into the mac-mini and run the `upgrades` script

```
ssh mac-mini '/Users/stevenloria/dotfiles/bin/upgrades'
```
