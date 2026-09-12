# dotfiles

## 🔧 Configuration Files

- `.aliases` - all aliases
- `.exports` - all environment variables
- `.extras` - custom settings you don’t want to commit (_optional_)
- `.functions` - bash functions, called by aliases
- `.macos` - macos defaults
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
source install.sh
```

## 📚 Resources worth mentioning

- [awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
- [jesperorb](https://github.com/jesperorb/dotfiles)
- [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [webpro](https://github.com/webpro/dotfiles)
