#!/bin/bash

# install zsh
if [[ ! -x "$(which zsh)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install zsh
  elif [[ -x "$(which apt)" ]]; then
    sudo apt install zsh
  else
    echo "Don't know how to install ZSH yet"
    exit 1
  fi
fi

# setup zsh
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
