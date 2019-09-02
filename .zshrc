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
source "${HOME}/.iterm2_shell_integration.zsh"
