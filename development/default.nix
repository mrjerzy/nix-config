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

      # LSPs
      rnix-lsp
      statix
      vale
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
