#!/bin/bash

unset ZSH
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f /etc/debian_version ]; then
    echo "discovered debian OS"
    ./setup-debian.sh 
else
    echo "unknown OS - assuming arch-linux"
    ./setup-arch.sh
fi

chsh -s /bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -fs $DIR/.gitconfig ~/.gitconfig
ln -fs $DIR/.vimrc ~/.vimrc
ln -fs $DIR/.zshrc ~/.zshrc
source ~/.zshrc
