{ config, lib, pkgs, ...}:

{ 
  config = { 
    home.packages = with pkgs; [
      podman
      just
      hugo
    ];
  };

  imports = [
    ./alacritty
    ./fish
    ./go
    ./k8s
    ./neovim
    ./zsh
    ./tmux
    ./java
  ];

}
