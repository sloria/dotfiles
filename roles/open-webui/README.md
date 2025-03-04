# open-webui

Runs open-webui using `uv tool run`.

Tailing logs:

```
lctl tail open-webui
```

# updating

uv runs the latest version of open-webui, so to use the latest version,
restart the agent.

```
lctl reload open-webui && lctl tail open-webui
```

# restic backups

Backups are taken using restic and are stored in a Cloudflare R2 bucket.
To set this up, set the following variables in `~/.localrc`

```bash
# Cloudflare R2 credentials for restic
export AWS_ACCESS_KEY_ID=CHANGEME
export AWS_SECRET_ACCESS_KEY=CHANGEME
# Restic settings
export RESTIC_PASSWORD=CHANGEME
export RESTIC_REPOSITORY=s3:https://CHANGEME.r2.cloudflarestorage.com/CHANGEME
```

Initialize the restic repo in R2

```
reload!
restic init
```

Then run the dot-update script to set up regular backups.

```
dot-update open-webui
```
