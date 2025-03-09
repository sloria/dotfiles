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
# Need to use full path to restic in order to work in launchd
/opt/homebrew/bin/restic backup $tmp_path.gz --tag open-webui
echo "==> Pruning old snapshots..."
/opt/homebrew/bin/restic  forget --tag open-webui --prune --keep-daily 3
echo "==> Backup complete."

echo "==> Starting open-webui..."
launchctl load ~/Library/LaunchAgents/com.sloria.open-webui.plist
echo "==> done."
