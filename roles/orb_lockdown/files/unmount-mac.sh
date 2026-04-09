#!/bin/bash
# Unmount all virtiofs filesystem mounts in OrbStack VMs
# This prevents them from reading host files.

set -e

for mount_point in /mnt/mac /Users /Applications /Library /Volumes /private; do
  if mountpoint -q "$mount_point" 2>/dev/null; then
    umount -l "$mount_point"
  fi
done
