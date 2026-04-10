# wireguard

Installs WireGuard and copies VPN profiles to `/etc/wireguard/`.

## Setup

Place `.conf` files in `roles/wireguard/files/profiles/`. These are git-ignored.

Set `wireguard_profile` in orb's group_vars to the name of the profile to auto-start (without `.conf`).

```
# in group_vars/orb.local.yaml
wireguard_profile: my-wg-profile
```

## Usage

```
# Connect
sudo wg-quick up <profile>
# Disconnect
sudo wg-quick down <profile>
# Check
sudo wg show
```
