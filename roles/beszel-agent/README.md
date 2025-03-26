# Beszel

I use [Beszel](https://beszel.dev/) for lightweight monitoring of my mac mini server. It shows stats on both the host and the Docker containers.

The UI is run using docker/docker compose (configured in a different repo). This role installs the Beszel agent on the mac mini host.

Before running it, the Beszel SSH key needs to be set.

In the Beszel UI: Add System > Name: Mac Mini, Host/IP: host.docker.internal, Port: 45876 (leave as default), Public Key: Copy the key. Add System.

Paste the key into `~/.localrc`

```
export BESZEL_AGENT_KEY="<SSH Key generated in Beszel UI>"
```

Then run the role using the `dot-update-remote` command:

```
reload!
dot-update-remote beszel-agent
```
