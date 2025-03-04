#!/bin/sh

set -e

db_path='/opt/homebrew/var/open-webui/webui.db'
tmp_path="/tmp/webui.db"

echo "==> Stopping open-webui..."
launchctl unload ~/Library/LaunchAgents/com.sloria.open-webui.plist

echo "==> Backing up webui.db..."

rm -f $tmp_path $tmp_path.gz
sqlite3 $db_path "VACUUM INTO '$tmp_path'"
gzip $tmp_path
echo "==> Database copy created: $tmp_path"

echo "==> Backing up to R2 bucket..."
restic backup $tmp_path.gz
echo "==> Pruning old snapshots..."
restic forget --keep-last 3 --prune
echo "==> Backup complete."

echo "==> Starting open-webui..."
launchctl load ~/Library/LaunchAgents/com.sloria.open-webui.plist
echo "==> done."
