#!/bin/bash
dotfiles_home="$HOME/dotfiles"

__print_header() {
  num_chars=$(echo $1 | wc -c)
  for i in $(seq 0 $num_chars); do
    printf "-"
  done
  printf "\n%s |\n" "$1"
  for i in $(seq 0 $num_chars); do
    printf "-"
  done
  printf "\n"
}

zsh() {
  zsh_config="$dotfiles_home/zsh"
  __print_header "Installing ZSH"
  source "$zsh_config/install.sh"
}

all() {
  zsh;
}

list() {
  declare -F | awk '{print $3}'
}

case "${1-}" in
  list) list;;
  '') list;;
  *) $1;;
esac
