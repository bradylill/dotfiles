#!/bin/bash

# install fish
if [[ ! -x "$(which fish)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install fish
  elif [[ -x "$(which apt)" ]]; then
    sudo apt install -y fish
  elif [[ -x "$(which dnf)" ]]; then
    sudo dnf install -y fish
  else
    echo "Don't know how to install fish yet"
    exit 1
  fi
fi

# setup fish
if [[ ! -s "$HOME/.config/fish/config.fish" ]]; then
  echo "Linking fishrc to $HOME"
  mkdir -p "$HOME/.config/fish"
  ln -s "$mod_config_dir/config.fish" "$HOME/.config/fish/config.fish"
fi

if [[ "$(basename $SHELL)" != "fish" ]]; then
  echo "Changing the shell to fish."
  chsh -s `which fish`
else
  echo "Shell is already $SHELL"
fi
