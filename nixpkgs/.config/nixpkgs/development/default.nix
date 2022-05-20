{ config, lib, pkgs, ...}:

{ 
  config = { 
    home.packages = with pkgs; [
      podman
      just
      hugo
      vscode
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
