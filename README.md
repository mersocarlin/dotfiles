# dotfiles

## 📚 Sources

There's a lot a good dotfiles resources out there.
And in order to build my own dotfiles repo, I took some ideas from:

- [awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
- [jesperorb](https://github.com/jesperorb/dotfiles)
- [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [webpro](https://github.com/webpro/dotfiles)

## 🔧 Configuration Files

- `.aliases` - all aliases
- `.exports` - all environment variables
- `.extras` - custom settings you don’t want to commit (_optional_)
- `.functions` - bash functions, called by aliases
- `.zshrc` - zsh config

### 💅 Custom settings

If `.extras` exists, it will be sourced along with the other files.
You can use this to add a few custom commands you don’t want to commit to a public repository.
You could also use `.extras` to override settings, functions and aliases from my dotfiles repository.

Example:

```bash
# Git credentials
GIT_AUTHOR_NAME="Your name here"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="Your email here"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

## 🔥 Install

```bash
source install.sh
```
