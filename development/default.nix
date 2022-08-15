{ config, lib, pkgs, ...}:

{ 
  config = { 
    home.packages = with pkgs; [
      vscode
      python38
      pre-commit
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
