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

__install() {
  mod_config_dir="$dotfiles_home/$1"
  __print_header "Installing $1"
  source "$mod_config_dir/install.sh"
  echo "Done installing $1"
}

zsh() {
  __install "zsh"
}

rust() {
  __install "rust"
}

golang() {
  __install "golang"
}

python() {
  __install "python"
}

node() {
  __install "node"
}

nvim() {
  __install "nvim"
}

all() {
  zsh
  rust
  golang
  python
  node
  nvim
}

list() {
  declare -F | grep -vi "__" | awk '{print $3}'
}

case "${1-}" in
  list) list;;
  '') list;;
  *) $1;;
esac
