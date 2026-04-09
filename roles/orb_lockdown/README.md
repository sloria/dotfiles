# orb_lockdown

Disables file sharing and SSH agent forwarding in OrbStack VMs for better isolation.

OrbStack mounts the Mac filesystem into VMs via virtiofs at `/mnt/mac`, `/Users`,
`/Applications`, `/Library`, `/Volumes`, and `/private` (all read/write). A systemd
oneshot service unmounts all six mount points on boot.

NOTE: OrbStack has an undocumented `isolated` mode
(https://github.com/orbstack/orbstack/issues/169#issuecomment-4002845669) but it
breaks the guest agent, which disables `pbcopy` and other macOS command proxies.
The unmount approach preserves guest agent functionality.

### SSH agent isolation

OrbStack forwards the host's SSH agent socket. A `/etc/profile.d/` script unsets
`SSH_AUTH_SOCK`, preventing login shells from using the host's SSH keys.

## what it doesn't do

- Network isolation: the VM has full internet access and can reach the host via `host.orb.internal`
- Linked binaries: `pbcopy`, `mac`, etc. are still available in the VM
