#!/bin/bash

# Checks that install.sh left a working setup behind.
# ./test.sh           check this machine
# ./test.sh --docker  run install.sh and the checks in a fresh Debian container

if [ "$1" = "--docker" ]; then
  cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
  exec docker run --rm -v "$PWD":/dotfiles:ro -e DEBIAN_FRONTEND=noninteractive debian:bookworm-slim bash -c '
    apt-get update -qq >/dev/null && apt-get install -y -qq curl git ca-certificates >/dev/null 2>&1
    cp -r /dotfiles /root/dotfiles && cd /root/dotfiles
    ./install.sh >/dev/null 2>&1 || { echo "install.sh failed"; exit 1; }
    ./test.sh'
fi

fail=0

check() {
  local label="$1"; shift
  if "$@" >/dev/null 2>&1; then
    echo "ok    $label"
  else
    echo "FAIL  $label"
    fail=1
  fi
}

# zsh -i loads oh-my-zsh and the dotfiles the way a terminal would. Only the
# last line is compared, so anything the shell prints on startup is ignored.
# ZSH_DISABLE_COMPFIX stops compinit from prompting about directory permissions on CI.
zsh_check() {
  local label="$1" cmd="$2" pattern="$3" out
  out=$(ZSH_DISABLE_COMPFIX=true zsh -ic "$cmd" 2>/dev/null | tail -n 1)
  if [[ "$out" =~ $pattern ]]; then
    echo "ok    $label"
  else
    echo "FAIL  $label (got: '$out')"
    fail=1
  fi
}

for cmd in http jq zsh ffmpeg; do
  check "$cmd installed" command -v "$cmd"
done

for name in zshrc exports aliases functions gitconfig; do
  check ".$name linked" test -L "$HOME/.$name"
done

check "oh-my-zsh installed" test -s "$HOME/.oh-my-zsh/oh-my-zsh.sh"
check "zsh-autosuggestions installed" test -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
check "zsh-syntax-highlighting installed" test -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

check "zsh syntax" zsh -n "$HOME/.zshrc" "$HOME/.exports" "$HOME/.aliases" "$HOME/.functions"
check "bash syntax" bash -n install.sh packages.sh apps.sh postinstall.sh test.sh
# -C avoids repo discovery in the current directory; only the global file matters here.
check "git config loads" git -C "$HOME" config --global init.defaultBranch

zsh_check "from_today" 'from_today 7d' '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
zsh_check "from_today rejects bad unit" 'from_today 7x 2>&1 || echo rejected' 'rejected'
zsh_check "localip" 'localip' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
zsh_check "suffix alias" 'alias -s md' '=open_file$'
zsh_check "open_file defined" 'whence -w open_file' 'function'
zsh_check "reload alias" 'alias reload' 'exec zsh'
zsh_check "path has ~/.local/bin" '[[ ":$PATH:" == *":$HOME/.local/bin:"* ]] && echo found' '^found$'

exit $fail
