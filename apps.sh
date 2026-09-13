#!/bin/bash

# Sets up zsh: oh-my-zsh, plugins and the default shell.
# Run packages.sh first so zsh is installed.

if ! command -v zsh >/dev/null 2>&1; then
  echo "zsh is not installed. Run packages.sh first." >&2
  exit 1
fi

ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

# Install oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
# RUNZSH=no keeps the installer from dropping us into zsh mid-script,
# CHSH=no because we change the shell ourselves below, and
# KEEP_ZSHRC=yes leaves ~/.zshrc alone; postinstall.sh replaces it.
if [ -d "$ZSH" ]; then
  echo "oh-my-zsh is installed"
else
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

install_zsh_plugin() {
  local name="$1" repo="$2"
  if [ -d "$ZSH_CUSTOM/plugins/$name" ]; then
    echo "$name is installed"
  else
    git clone "$repo" "$ZSH_CUSTOM/plugins/$name"
  fi
}

install_zsh_plugin zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
install_zsh_plugin zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git

# Set zsh as default shell
zsh_path="$(command -v zsh)"
if [ "$SHELL" != "$zsh_path" ]; then
  if ! grep -qx "$zsh_path" /etc/shells 2>/dev/null; then
    echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
  fi
  chsh -s "$zsh_path"
fi
