# caddy

I use caddy as a reverse proxy in front of internal services, so that they can be accessed over HTTPS by domain name rather than by IP or tailscale machine name and port.

## setup

Follow the instructions in https://www.youtube.com/watch?v=Vt4PDUXB_fg.

Get your Cloudflare API token from https://dash.cloudflare.com/profile/api-tokens
and make sure it has `Zone.Zone:Read` and `Zone.DNS:Edit` scopes, per the instructions here: https://github.com/libdns/cloudflare?tab=readme-ov-file#authenticating

![Token](https://github.com/user-attachments/assets/83911a7c-dfe9-49bc-a02e-cdf4440dbf74)

Replace CHANGEME in the Caddyfile

## updating Caddyfile

Update the `Caddyfile` in `/opt/homebrew/etc/Caddyfile`.

## commands

Use `brew services` to manage the caddy process:

```
brew services restart caddy
```

Viewing logs:

```
tail -f /opt/homebrew/var/log/caddy.log
```
