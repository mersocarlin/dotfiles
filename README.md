# dotfiles

Shell setup for macOS and Linux (Debian/Ubuntu, Fedora, Arch).

## 🔧 Configuration Files

- `.aliases` - all aliases
- `.exports` - all environment variables
- `.extras` - custom settings you don’t want to commit (_optional_)
- `.functions` - zsh functions, called by aliases
- `.zshrc` - zsh config

### 🎛️ Custom settings

If `.extras` exists, it will be sourced along with the other files.
You can use this to add a few custom commands you don’t want to commit to a public repository.
You could also use `.extras` to override settings, functions and aliases from my dotfiles repository.

Example:

```bash
# Git credentials
git config --global user.name "Your Name"
git config --global user.email "YOUR_GITHUB_ID+YOUR_USERNAME@users.noreply.github.com"
```

## 🚀 Install

```bash
./install.sh
```

This runs three scripts in order. Each one can also be run on its own:

- `packages.sh` - installs httpie, jq, zsh and ffmpeg. Uses Homebrew on macOS (installing it first if needed) and apt, dnf or pacman on Linux.
- `apps.sh` - installs oh-my-zsh with the zsh-autosuggestions and zsh-syntax-highlighting plugins, and makes zsh the default shell.
- `postinstall.sh` - symlinks the dotfiles into `$HOME`. Any existing file is moved to `~/.dotfiles-backup/<timestamp>/` first.

## 📖 Docs

- [Persistent SSH agent with Herdr](docs/references/ssh-agent-herdr.md)

## 📚 Resources worth mentioning

- [awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
- [jesperorb](https://github.com/jesperorb/dotfiles)
- [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [webpro](https://github.com/webpro/dotfiles)
