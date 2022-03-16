{ config, lib, pkgs, ...}: 

{ 
  imports = [
    ./alacritty
    ./fish
    ./go
    ./k8s
    ./neovim
    ./zsh
  ];
}
