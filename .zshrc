#!/bin/bash

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"

plugins=(
  docker
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

for file in $HOME/.{exports,aliases,functions,extras}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# Use persistent SSH agent from Herdr sessions if available
if [ -f "$HOME/.ssh-agent-herdr-env" ]; then
  . "$HOME/.ssh-agent-herdr-env" >/dev/null 2>&1
fi
