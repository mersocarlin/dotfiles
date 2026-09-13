#!/bin/bash

# Symlinks the dotfiles into $HOME, backing up anything already there.

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

for name in zshrc exports aliases functions gitconfig extras; do
  src="$DOTFILES_DIR/.$name"
  dest="$HOME/.$name"

  [ -f "$src" ] || continue

  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -f "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/.$name"
    echo "Backed up $dest to $BACKUP_DIR/.$name"
  fi

  ln -s "$src" "$dest"
done

if [ -f "$BACKUP_DIR/.gitconfig" ] && [ ! -f "$HOME/.gitconfig.local" ]; then
  echo "Your old .gitconfig was backed up. Put its [user] section in ~/.gitconfig.local."
fi
