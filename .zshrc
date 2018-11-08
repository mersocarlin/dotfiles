#!/bin/bash

ZSH_THEME="bira"

plugins=(docker git zsh-autosuggestions)

for file in $HOME/.{exports,aliases,functions,extras}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source $ZSH/oh-my-zsh.sh
