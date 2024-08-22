#!/bin/zsh

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

echo "Installing Submodules (Nvim)"
git submodule update --init --recursive --force

echo "Copy this folder to ~/.config"
if [  -d ~/.config ]; then
    echo "Folder ~/.config already exists, backup to ~/.config.bak"
    mv ~/.config ~/.config.bak
fi
# Symlink the config folder to ~/.config
ln -s "$(pwd)/.config" ~/.config

echo "Copy this folder to ~/.ssh"
if [ -d ~/.ssh ]; then
    echo "Folder ~/.ssh already exists, backup to ~/.ssh.bak"
    mv ~/.ssh ~/.ssh.bak
fi
cp -r ./.ssh ~/.ssh

cd ~/.config

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo eval "$(/opt/homebrew/bin/brew shellenv)" >> ~/.bash_profile
source ~/.bash_profile

echo "Installing Applications using Homebrew"
brew bundle --file=Brewfile

echo "Symlink zsh config"
ln -sf ~/.config/.zshrc ~/.zshrc

echo "Apply spicetify"
spicetify backup apply
spicetify config current_theme catppuccin
spicetify config color_scheme mocha
spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
spicetify apply

source ~/.zshrc

echo "Install Node LTS using NVM"
nvm install lts
nvm use lts

# open -a Aerospace