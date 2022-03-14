{ config, lib, pkgs, ...}: 

{ 
  imports = [
    ./zsh
    ./neovim
    ./fish
    ./k8s
    ./go
    ./alacritty
  ];
}
