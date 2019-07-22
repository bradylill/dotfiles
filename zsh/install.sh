#!/bin/bash

# install zsh
if [[ ! -x "$(which zsh)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install zsh
  elif [[ -x "$(which apt)" ]]; then
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

if [[ ! -s "$HOME/.oh-my-zsh" ]]; then
  echo "Downloading and linking oh-my-zsh."
  mkdir -p "$HOME/code/opensource"
  git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/code/opensource/oh-my-zsh"
  ln -s "$HOME/code/opensource/oh-my-zsh" "$HOME/.oh-my-zsh"
fi

if [[ "$(basename $SHELL)" != "zsh" ]]; then
  echo "Changing the shell to zsh."
  chsh -s /bin/zsh
else
  echo "Shell is already $SHELL"
fi
