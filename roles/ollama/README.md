# ollama

Install ollama and run it via launchd

Finding the pid:

```
launchctl list | rg ollama
```

Tailing logs:

```
tail -f /opt/homebrew/var/log/ollama.log
```

# updating

```
brew upgrade ollama
```
