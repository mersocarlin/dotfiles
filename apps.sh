#!/bin/bash

# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set zsh as default shell
chsh -s $(which zsh)

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Install zsh-nvm plugin
git clone https://github.com/lukechilds/zsh-nvm $ZSH_CUSTOM/plugins/zsh-nvm

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Set up keyboard shortcuts
cp -r ./apps/spectacle/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null
