#!/bin/bash
# This script is installing a development environment 
# install nix
# uncomment this line, if you want to install nix
sudo rm  /etc/bashrc.backup-before-nix
sudo rm /etc/zshrc.backup-before-nix
sudo rm /etc/bash.bashrc.backup-before-nix
curl -L https://releases.nixos.org/nix/nix-2.6.1/install | sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install
