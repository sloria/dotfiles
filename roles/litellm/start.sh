#!/bin/bash
echo "==> Starting litellm and db..."
docker compose up -d --force-recreate
echo "==> done."
