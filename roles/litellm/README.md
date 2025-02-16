# litellm

Runs litellm to proxy requests to hosted models. This allows accessing Claude and other models through Open WebUI.
It also exposes a UI at http://localhost:4000/ui for tracking and limiting usage costs.

More models can be added in either `config.yaml` or through the UI.

NOTE: litellm needs to be configured and run manually. Running `dot-update` or `dot-bootstrap` will not run it.

## setup

```
cd roles/litellm
cp .env.example .env
```

In `.env`, set `MASTER_KEY` and `LITELLM_SALT_KEY` to random strings prefixed with `sk-`
Also set API keys for the upstream APIs.

## starting litellm

```
./start.sh
```
