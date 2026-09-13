#!/bin/bash

# Installs the base CLI tools on macOS (Homebrew) or Linux (apt, dnf or pacman).

PACKAGES=(httpie jq zsh ffmpeg)

install_brew() {
  if command -v brew >/dev/null 2>&1; then
    return
  fi

  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # A fresh install is not on PATH yet in this shell.
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

install_brew_package() {
  if brew ls --versions "$1" >/dev/null; then
    echo "$1 is installed"
  else
    brew install "$1"
  fi
}

install_macos_packages() {
  install_brew

  brew update
  # Upgrading touches every formula on the machine, so only do it when asked.
  [ "${BREW_UPGRADE:-0}" = 1 ] && brew upgrade

  for pkg in "${PACKAGES[@]}"; do
    install_brew_package "$pkg"
  done

  brew cleanup
}

install_linux_packages() {
  local sudo=""
  [ "$(id -u)" -ne 0 ] && sudo="sudo"

  if command -v apt-get >/dev/null 2>&1; then
    $sudo apt-get update
    $sudo apt-get install -y "${PACKAGES[@]}"
  elif command -v dnf >/dev/null 2>&1; then
    $sudo dnf install -y "${PACKAGES[@]}"
  elif command -v pacman >/dev/null 2>&1; then
    $sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
  else
    echo "No supported package manager found (apt-get, dnf or pacman)." >&2
    return 1
  fi
}

case "$(uname -s)" in
  Darwin) install_macos_packages ;;
  Linux)  install_linux_packages ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac
