#!/bin/bash

# Install Homebrew
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew..."; \
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

function install_brew_package() {
  if brew ls --versions $1 > /dev/null; then
    echo "$1 is installed"
  else
    brew install $1
  fi
}


# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

install_brew_package httpie
install_brew_package jq
install_brew_package zsh

## Compress muted videos by ~90%
install_brew_package ffmpeg

# Remove outdated versions from the cellar.
brew cleanup
