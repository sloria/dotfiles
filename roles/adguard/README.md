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

If you're using the Caddy role, add the following to `/opt/homebrew/etc/Caddyfile` so that you can access
the UI from your custom domain.

```
adguard.in.your-domain.com {
    reverse_proxy http://localhost:4321
    import cloudflare
}
```
