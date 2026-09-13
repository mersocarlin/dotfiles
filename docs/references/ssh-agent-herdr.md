# Persistent SSH agent with Herdr

This setup lets you type your SSH key passphrase only once per reboot, even across multiple logins and Herdr sessions.

## Overview

- A long‑lived `ssh-agent` is started inside a Herdr session.
- Its environment is saved to `~/.ssh-agent-herdr-env`.
- The `.zshrc` in this repo sources that file when it exists, so every new shell uses the same agent. Nothing to add by hand.
- Your private key is loaded into the agent once with `ssh-add`; after that, no further passphrase prompts appear unless the agent stops (e.g. reboot).

## Initial setup (run once)

Inside a Herdr session:

```bash
# 1. Start SSH agent and save env
ssh-agent -s > ~/.ssh-agent-herdr-env
. ~/.ssh-agent-herdr-env

# 2. Load your SSH key (passphrase prompt here, once)
# Replace with your actual key path if different
ssh-add ~/.ssh/id_ed25519  # or ~/.ssh/id_rsa, etc.

# 3. Reload zsh so it picks up the agent
exec zsh
```

Test:

```bash
ssh-add -l          # should list your key, no prompt
ssh user@your-server  # should log in without asking for anything
```

Detach and reattach Herdr; the key should still be loaded with no new passphrase prompt.

## After reboot or if the agent dies

If you reboot or the agent process stops, repeat the following inside Herdr:

```bash
ssh-agent -s > ~/.ssh-agent-herdr-env
. ~/.ssh-agent-herdr-env

# Replace with your actual key path if different
ssh-add ~/.ssh/id_ed25519  # or ~/.ssh/id_rsa, ~/.ssh/id_ed25519_hetzner_cx32, etc.
```

You’ll be asked for the passphrase once; after that, everything works as before.

## Useful commands

```bash
ssh-add -l          # list loaded keys
ssh-add -D          # remove all keys from the agent
ssh-add ~/.ssh/id_ed25519  # add key again (adjust path as needed)
```
