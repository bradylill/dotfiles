#!/bin/bash

if [[ ! -s ~/.zshrc ]]; then
  echo "Linking zshrc to ~"
  ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
fi

if [[ ! -s ~/.oh-my-zsh ]]; then
  echo "Downloading and linking oh-my-zsh."
  mkdir -p ~/code/opensource
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/code/opensource/oh-my-zsh
  ln -s ~/code/opensource/oh-my-zsh ~/.oh-my-zsh
fi

if [[ "$(basename $SHELL)" != "zsh" ]]; then
  echo "Changing the shell to zsh."
  chsh -s /bin/zsh
else
  echo "Shell is already $SHELL"
fi

echo "Done setting up ZSH"
