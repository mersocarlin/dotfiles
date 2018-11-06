#!/bin/bash

# Remove existing symlinks/dotfiles from $HOME
for file in $HOME/.{zshrc,exports,aliases,functions,extras}; do
	[ -r "$file" ] && [ -f "$file" ] && rm $file;
done;
unset file;

# Symlink dotfiles
DOTFILES_DIR=$(pwd)

for file in $DOTFILES_DIR/.{zshrc,exports,aliases,functions,extras}; do
	[ -r "$file" ] && [ -f "$file" ] && ln -s $file $HOME;
done;
unset file;
