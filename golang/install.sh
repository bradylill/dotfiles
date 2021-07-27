#!/bin/bash

if [[ ! -x "$(command -v go)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install go
  elif [[ -x "$(command -v apt)" ]]; then
    version="1.16.3"
    checksum="951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"

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
