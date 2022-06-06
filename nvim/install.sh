#!/bin/bash

# install nvim
if [[ ! -x "$(command -v nvim)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install neovim
  elif [[ -x "$(command -v apt)" ]]; then
    sudo apt update
    sudo apt -y install neovim
  elif [[ -x "$(command -v dnf)" ]]; then
    sudo dnf install -y neovim
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

  # plug.vim
  mkdir -p "$HOME/.local/share/nvim/site/autoload"
  ln -s "$mod_config_dir/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"
fi
