#!/bin/bash
dotfiles_home="$HOME/dotfiles"
zsh_config="$dotfiles_home/zsh"

# setup zsh
if [[ $OSTYPE == "darwin"* ]]; then
  brew install zsh
elif [[ -x "$(which apt)" ]]; then
 sudo apt install zsh
else
  echo "Don't know how to install ZSH yet"
  exit 1
fi

source "$zsh_config/enable_zsh.sh"
