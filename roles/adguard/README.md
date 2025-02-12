# AdGuard Home

Installs AdGuard Home.

## initial setup

After installing navigate to <server host>:3000 and go through the initial wizard.

By default, AdGuard uses port 80 for the web interface, which interferes will interfere with Caddy.
Edit AdGuardHome.yaml to change the default port to serve the web interface on.

```
sudo vim /Applications/AdGuardHome/AdGuardHome.yaml
```

Then change `http.address` to use a different port.

```yaml
http:
  address: 0.0.0.0:4321
```

Then restart the server

```
sudo /Applications/AdGuardHome/AdGuardHome -s restart
```

## DNS setup

In the admin interface, go to Filters > DNS Rewrites and add a DNS rewrite with a wildcard for internal domains that points to the tailscale IP.

```
*.int.barkerloria.com -> <tailscale IP>
```
