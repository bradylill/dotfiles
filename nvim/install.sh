#!/bin/bash

# install nvim
if [[ ! -x "$(which nvim)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install neovim
  elif [[ -x "$(which apt)" ]]; then
    sudo apt install -y software-properties-common
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt update
    sudo apt -y install neovim
  else
    echo "Don't know how to install ZSH yet"
    exit 1
  fi
fi

# setup nvim
if [[ ! -d ~/.config/nvim ]]; then
  echo "Linking nvim to $HOME/.config/nvim"
  mkdir -p "$HOME/.config"
  ln -s "$mod_config_dir" "$HOME/.config/nvim"
fi
