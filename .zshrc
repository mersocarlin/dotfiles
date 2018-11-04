#!/bin/bash

ZSH_THEME="bira"

plugins=(docker git zsh-autosuggestions)

DOTFILES_DIR=$(pwd)
for file in $DOTFILES_DIR/.{exports,aliases,functions,extras}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source $ZSH/oh-my-zsh.sh
