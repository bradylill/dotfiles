#!/bin/bash

if [[ ! -x "$(which pyenv)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install pyenv
    brew install openssl readline sqlite3 xz zlib
  elif [[ -x "$(which apt)" ]]; then
     git clone https://github.com/pyenv/pyenv.git ~/.pyenv
     git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

     sudo apt-get update
     sudo apt-get install -y --no-install-recommends \
       make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev \
       wget curl llvm libncurses5-dev xz-utils \
       tk-dev libxml2-dev libxmlsec1-dev libffi-dev \
       liblzma-dev
  elif [[ -x "$(which dnf)" ]]; then
     git clone https://github.com/pyenv/pyenv.git ~/.pyenv
     git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

     sudo dnf install -y \
       bzip2-devel readline-devel sqlite-devel \
       tk-devel gdbm-devel
  else
    echo "Don't know how to install python yet"
    exit 1
  fi
else
  echo "python already installed"
  pyenv --version
fi
