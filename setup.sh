#! /bin/bash

pacman -Sy
pacman -S git
pacman -S zsh
chsh -s /bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -s .gitconfig ~/.gitconfig
