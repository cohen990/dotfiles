#! /bin/bash

case "$1" in
    --personal|-p)
        echo "Installing for a personal computer"
        personal=true
        ;;
esac

repos=()

sudo dnf install -y dnf-plugins-core

repos+=("https://mise.jdx.dev/rpm/mise.repo")
repos+=("https://download.docker.com/linux/fedora/docker-ce.repo")

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
packages+=("docker-ce")
packages+=("docker-ce-cli")
packages+=("containerd.io")
packages+=("docker-buildx-plugin")
packages+=("docker-compose-plugin")

if [[($personal)]] ; then
    echo "Adding dependencies for a personal computer"
    packages+=("https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm")
    packages+=("https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm")
    packages+=("steam")
fi

sudo dnf config-manager addrepo --from-repofile=${repos[*]}
sudo dnf install -y ${packages[*]}
