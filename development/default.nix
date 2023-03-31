{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      vscode
      python38
      pre-commit
      postman
      nodejs
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
