#!/bin/bash

if [[ ! -x "$(which rustc)" ]]; then
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install rustup-init
    rustup-init -y
  elif [[ -x "$(which apt)" ]]; then
    version="1.18.3"
    checksum="9bbf4987fc0b46658249c176004271bebc3126530cb2aff347776a9549a48321"

    pushd /tmp
    curl -O "https://raw.githubusercontent.com/rust-lang/rustup.rs/$version/rustup-init.sh"

    if [[ $checksum != $(sha256sum ./rustup-init.sh | awk '{ print $1 }') ]]; then
      echo "WARNING: rustup-init script checksum does not match!"
      exit 1
    fi

    chmod +x ./rustup-init.sh
    ./rustup-init.sh -y

    popd
  else
    echo "Don't know how to install rust yet"
    exit 1
  fi
else
  echo "rust already installed"
  rustc --version
fi
