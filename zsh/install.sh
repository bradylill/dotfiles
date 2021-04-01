#!/bin/bash

# install zsh
if [[ ! -x "$(command -v zsh)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install zsh
  elif [[ -x "$(command -v apt)" ]]; then
    sudo apt install -y zsh
  else
    echo "Don't know how to install ZSH yet"
    exit 1
  fi
fi

# setup zsh
if [[ ! -s "$HOME/.zshrc" ]]; then
  echo "Linking zshrc to $HIME"
  ln -s "$mod_config_dir/zshrc" "$HOME/.zshrc"
fi

if [[ "$(basename $SHELL)" != "zsh" ]]; then
  echo "Changing the shell to zsh."
  chsh -s /bin/zsh
else
  echo "Shell is already $SHELL"
fi
