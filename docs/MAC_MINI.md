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
- System Settings / General / Sharing / Content Caching - Storage, Clients / Devices using the same public IP address, use ony public IP address.
- System Settings / General / Sharing / Remote Login - On. This allows SSH while while using Tailscale

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
ssh mac-mini
upgrades
```
