#!/bin/bash

echo "Linking zshrc to ~"
ln -s ~/dotfiles/shell/zshrc ~/.zshrc

echo "Downloading and linking oh-my-zsh."
mkdir -p ~/code/opensource
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/code/opensource/oh-my-zsh
ln -s ~/code/opensource/oh-my-zsh ~/.oh-my-zsh

echo "Changing the shell to zsh."
chsh -s /bin/zsh
