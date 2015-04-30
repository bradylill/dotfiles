#!/bin/bash

gosrc=~/code/opensource/go

mkdir -p ~/code/projects/go
mkdir -p $gosrc

git clone https://github.com/golang/go.git $gosrc

pushd $gosrc
git checkout go1.4.2
pushd ./src
./all.bash
