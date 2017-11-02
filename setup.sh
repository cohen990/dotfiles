#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pacman -Sy
pacman -S zsh --noconfirm
pacman -S wget --noconfirm
chsh -s /bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.vimrc ~/.vimrc
