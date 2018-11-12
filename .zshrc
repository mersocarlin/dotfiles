#!/bin/bash

ZSH_THEME="avit"

plugins=(
  docker
  git zsh-autosuggestions
  zsh-syntax-highlighting
)

for file in $HOME/.{exports,aliases,functions,extras}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source $ZSH/oh-my-zsh.sh
