#!/bin/bash

ZSH_THEME="avit"

plugins=(
  docker
  git 
  zsh-autosuggestions
  zsh-nvm
  zsh-syntax-highlighting
)

for file in $HOME/.{exports,aliases,functions,extras}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source $ZSH/oh-my-zsh.sh

# Enforce node stable version on startup
nvm use stable

# Load zsh shell integration
SHELL_INTEGRATION=${HOME}/.iterm2_shell_integration.zsh
if test -f "$SHELL_INTEGRATION"; then
  source $SHELL_INTEGRATION
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
