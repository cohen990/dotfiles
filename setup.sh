#!/bin/bash


ln -fs `pwd`/.gitconfig ~/.gitconfig
ln -fs `pwd`/.vimrc ~/.vimrc
ln -fs `pwd`/.git-commit-template ~/.git-commit-template

mkdir ~/.config
mkdir ~/.config/i3
mkdir ~/.config/fish

ln -fs `pwd`/config.fish ~/.config/fish/config.fish
ln -fs `pwd`/i3.config ~/.config/i3/config
