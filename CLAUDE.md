# dotfiles

Shell setup for macOS and Linux. Every change must work on both.

## Layout

- `.zshrc`, `.exports`, `.aliases`, `.functions`, `.gitconfig` are linked into `$HOME` by `postinstall.sh`. The shell files are zsh, not bash, even though the repo is mostly bash scripts.
- `.extras` and `.gitconfig.local` hold per-machine settings. Both are gitignored. `.extras` is sourced last and overrides everything else.
- `install.sh`, `packages.sh`, `apps.sh`, `postinstall.sh` are bash. They run before zsh is guaranteed to exist, so keep them bash.
- `test.sh` checks an installed setup. `./test.sh --docker` runs the install and the checks in a Debian container.
- `apps/` holds macOS-only extras (iTerm2 profile, Raycast scripts). Nothing installs them.

## Rules

- Anything that calls an OS tool needs a macOS path and a Linux path. BSD and GNU versions of `date`, `sed`, `stat` and `ls` take different flags. See `from_today` and `localip` in `.functions` for the pattern.
- Install scripts must be safe to run again. Check before installing. Back up before replacing.
- Before opening a PR run `./test.sh --docker` for Linux and `./install.sh && ./test.sh` for macOS. CI runs both on every PR.
- Comments explain why, never what. Most code needs none.
- After editing `~/.config/herdr/config.toml`, run `herdr server reload-config`. The server does not re-read the file on its own.
