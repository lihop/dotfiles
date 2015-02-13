#!/bin/sh

git submodule update --init
for dir in */; do stow $dir; done
git submodule foreach --recursive git checkout master
vim -c VundleUpdate -c quitall
