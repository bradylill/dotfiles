#!/bin/bash
set -o nounset
set -o errexit

if [[ ! -x "$(command -v nvm)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    echo "Don't know how to install node on mac yet"
    exit 1
  elif [[ -x "$(command -v apt)" ]] || [[ -x "$(command -v dnf)" ]]; then
      git clone https://github.com/nvm-sh/nvm.git ~/.nvm
      pushd ~/.nvm
      git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
      popd
      \. ~/.nvm/nvm.sh
      nvm --version
  else
    echo "Don't know how to install node yet"
    exit 1
  fi
else
  echo "node already installed"
fi
