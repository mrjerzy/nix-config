{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      vscode
      python38
      pre-commit
      postman
      nodejs
      terraform
    ];
  };


  imports = [
    ./go
    ./rust
    ./k8s
    ./neovim
    ./helix
    ./zsh
    ./tmux
    ./java
  ];

}
