#!/bin/bash

export CONFIG_DIR="$HOME/git/dotfiles"

ln -fs $CONFIG_DIR/.gitconfig $HOME/.gitconfig
ln -fs $CONFIG_DIR/.vimrc $HOME/.vimrc
ln -fs $CONFIG_DIR/.git-commit-template $HOME/.git-commit-template

mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/fish

ln -fs $CONFIG_DIR/zsh/zshrc $HOME/.zshrc
ln -fs $CONFIG_DIR/zsh/zprofile $HOME/.zprofile
ln -fs $CONFIG_DIR/zsh/p10k.zsh $HOME/.p10k.zsh

ln -fs $CONFIG_DIR/i3.config $HOME/.config/i3/config

ln -fs $CONFIG_DIR/nvim $HOME/.config
ln -fs $CONFIG_DIR/mise $HOME/.config
ln -fs $CONFIG_DIR/kitty $HOME/.config

ln -fs $CONFIG_DIR/tmux.conf $HOME/.tmux.conf

# Claude Code configuration
mkdir -p $HOME/.claude
ln -fs $CONFIG_DIR/claude/agents $HOME/.claude/

mise install
