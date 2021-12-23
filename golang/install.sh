#!/bin/bash

if [[ ! -x "$(command -v go)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install go
  elif [[ -x "$(command -v apt)" ]] || [[ -x "$(command -v dnf)" ]]; then
    version="1.17.3"
    checksum="550f9845451c0c94be679faf116291e7807a8d78b43149f9506c1b15eb89008c"

    pushd /tmp || exit 1
    if [[ ! -r "go$version.linux-amd64.tar.gz" ]]; then
     curl -O "https://dl.google.com/go/go$version.linux-amd64.tar.gz"
    fi

    if [[ $checksum != $(sha256sum "go$version.linux-amd64.tar.gz" | awk '{ print $1 }') ]]; then
      echo "WARNING: Golang binary checksum does not match!"
      exit 1
    fi

    sudo mkdir -p /usr/local/opt
    sudo tar -C /usr/local/opt -xzf "go$version.linux-amd64.tar.gz"
    sudo ln -s /usr/local/opt/go /usr/local/opt/go/libexec
    sudo ln -s /usr/local/opt/go/bin/go /usr/local/bin/go
    popd || exit 1

    mkdir -p "$HOME/go"
  else
    echo "Don't know how to install golang yet"
    exit 1
  fi
else
  echo "golang already installed"
  go version
fi
