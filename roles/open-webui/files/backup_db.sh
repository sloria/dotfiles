#!/bin/sh

dest="/opt/homebrew/var/open-webui/backups/webui.$(date +%Y-%m-%d_%H-%M-%S).db" 

echo "==> Stopping open-webui..."
launchctl unload ~/Library/LaunchAgents/com.sloria.open-webui.plist

echo "==> Backing up webui.db..."
cp /opt/homebrew/var/open-webui/webui.db $dest
echo "==> Backup created: $dest"

echo "==> Starting open-webui..."
launchctl load ~/Library/LaunchAgents/com.sloria.open-webui.plist
echo "==> done."
