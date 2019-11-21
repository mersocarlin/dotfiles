#!/bin/bash

# Install Homebrew
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew..."; \
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# macOS Mojave command in case you get an error with Command Line Tools
# command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew..."; \
#   /usr/bin/ruby -e "ARGV=['--force-curl'] $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

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

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install_brew_package coreutils
if [ ! -f "${BREW_PREFIX}/bin/sha256sum" ]; then
  ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
fi

# Install some other useful utilities like `sponge`.
install_brew_package moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
install_brew_package findutils

# Install GNU `sed`, overwriting the built-in `sed`.
install_brew_package gnu-sed --with-default-names

# Install `wget` with IRI support.
install_brew_package wget --with-iri

# Install more recent versions of some macOS tools.
install_brew_package vim --with-override-system-vi
install_brew_package grep
install_brew_package openssh
install_brew_package screen

# Install font tools.
brew tap bramstein/webfonttools
install_brew_package woff2

# Install other useful binaries.
install_brew_package ack
install_brew_package fx
install_brew_package git
install_brew_package git-lfs
install_brew_package httpie
install_brew_package imagemagick --with-webp
install_brew_package jq
install_brew_package lua
install_brew_package lynx
install_brew_package p7zip
install_brew_package pigz
install_brew_package pv
install_brew_package rename
install_brew_package rlwrap
install_brew_package ssh-copy-id
install_brew_package tree
install_brew_package vbindiff
install_brew_package yarn --without-node
install_brew_package zopfli
install_brew_package zsh

# Remove outdated versions from the cellar.
brew cleanup
