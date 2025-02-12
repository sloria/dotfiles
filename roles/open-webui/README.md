# open-webui

Runs open-webui using `uv tool run`

Finding the pid:

```
launchctl list | rg ollama
```

Tailing logs:

```
tail -f /opt/homebrew/var/log/ollama.log
```

# updating

uv runs the latest version of open-webui, so to use the latest version,
restart the agent.
