# dotfiles

Shell setup for macOS and Linux (Debian/Ubuntu, Fedora, Arch).

## 🔧 Configuration Files

- `.aliases` - all aliases
- `.exports` - all environment variables
- `.extras` - custom settings you don’t want to commit (_optional_)
- `.functions` - zsh functions, called by aliases
- `.gitconfig` - shared git settings
- `.zshrc` - zsh config

`apps/` holds macOS-only extras: an iTerm2 profile and a few Raycast scripts. Nothing installs them, import them by hand if you want them.

### 🎛️ Custom settings

Two files hold settings that stay on the machine and out of git.

`~/.extras` is sourced after the other files, so use it for commands you don’t want to commit and to override any setting, function or alias from this repository. Copy `.extras.example` to `~/.extras` to start.

`~/.gitconfig.local` is included by `.gitconfig`. Put your git identity and signing setup there:

```ini
[user]
	name = Your Name
	email = YOUR_GITHUB_ID+YOUR_USERNAME@users.noreply.github.com
```

## 🚀 Install

```bash
./install.sh
```

This runs three scripts in order. Each one can also be run on its own:

- `packages.sh` - installs httpie, jq, zsh and ffmpeg. Uses Homebrew on macOS (installing it first if needed) and apt, dnf or pacman on Linux.
- `apps.sh` - installs oh-my-zsh with the zsh-autosuggestions and zsh-syntax-highlighting plugins, and makes zsh the default shell.
- `postinstall.sh` - symlinks the dotfiles into `$HOME`. Any existing file is moved to `~/.dotfiles-backup/<timestamp>/` first.

Running it again is safe. Installed packages are skipped, oh-my-zsh and its plugins are left alone, and existing symlinks are refreshed without a backup. On macOS, `brew upgrade` only runs when you ask for it:

```bash
BREW_UPGRADE=1 ./install.sh
```

## ✅ Test

```bash
./test.sh           # check this machine after install.sh
./test.sh --docker  # run install.sh and the checks in a fresh Debian container
```

CI runs the install and the checks on Ubuntu and macOS for every pull request.

## 📖 Docs

- [Persistent SSH agent with Herdr](docs/references/ssh-agent-herdr.md)

## 📚 Resources worth mentioning

- [awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
- [jesperorb](https://github.com/jesperorb/dotfiles)
- [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [webpro](https://github.com/webpro/dotfiles)
