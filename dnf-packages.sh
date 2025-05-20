#! /bin/bash

repos=()

sudo dnf install -y dnf-plugins-core

repos+=("https://mise.jdx.dev/rpm/mise.repo")

packages=()

packages+=("nvim")
packages+=("vim")
packages+=("kitty")
packages+=("mise")
packages+=("nvim")
packages+=("fira-code-fonts")
packages+=("readline-devel")
packages+=("bat")
packages+=("zsh")

sudo dnf config-manager addrepo --from-repofile=${repos[*]}
sudo dnf install -y ${packages[*]}
