#!/bin/bash

# Install nvm (https://github.com/creationix/nvm)
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set zsh as default shell
chsh -s $(which zsh)

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

brew tap caskroom/cask
brew tap caskroom/versions

# 1Password
brew cask install 1password

# Docker
brew cask install docker

# Dropbox
brew cask install dropbox

# Chrome
brew cask install google-chrome

# iTerm2
brew cask install iTerm2

# Install the The Hulk theme for iTerm2
open "./apps-config/The\ Hulk.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Postman
brew cask install postman 

# Spectacle
brew cask install spectacle 

# Set up keyboard shortcuts
cp -r ./apps-config/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

# Spotify
brew cask install spotify

# Visual Studio Code
brew cask install visual-studio-code
