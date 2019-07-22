#!/bin/bash

if [[ ! -x "$(which go)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install go
  elif [[ -x "$(which apt)" ]]; then
    version="1.12.7"
    checksum="66d83bfb5a9ede000e33c6579a91a29e6b101829ad41fffb5c5bb6c900e109d9"

    pushd /tmp
    if [[ ! -r "go$version.linux-amd64.tar.gz" ]]; then
     curl -O "https://dl.google.com/go/go$version.linux-amd64.tar.gz"
    fi

    if [[ $checksum != $(sha256sum "go$version.linux-amd64.tar.gz" | awk '{ print $1 }') ]]; then
      echo "WARNING: Golang binary checksum does not match!"
      exit 1
    fi

    sudo mkdir -p /usr/local/opt
    sudo tar -C /usr/local/opt -xzfv "go$version.linux-amd64.tar.gz"
    sudo ln -s /usr/local/opt/go /usr/local/opt/go/libexec
    sudo ln -s /usr/local/opt/go/bin/go /usr/local/bin/go
    popd

    mkdir -p "$HOME/go"
  else
    echo "Don't know how to install golang yet"
    exit 1
  fi
else
  echo "golang already installed"
  go version
fi
