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
    ./go
    ./k8s
    ./neovim
    ./helix
    ./zsh
    ./tmux
    ./java
  ];

}
