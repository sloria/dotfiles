# open-webui

Runs open-webui using `uv tool run`.

Finding the pid:

```
launchctl list | grep open-webui
```

Tailing logs:

```
tail -f /opt/homebrew/var/open-webui/open-webui.log
```

# updating

uv runs the latest version of open-webui, so to use the latest version,
restart the agent.

```
lctl reload open-webui && lctl tail open-webui
```
