{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [

      cue
      act
      k6
      lazydocker
      lima
      
      vscode
      python38
      pre-commit
      postman
      nodejs

      packer
      terraform
      pulumi-bin

      # Nix Linters
      rnix-lsp
      statix

      ## Terraform Linters
      tflint
      terraform-lsp
      tfsec

      # Markdown Linters
      nodePackages.markdownlint-cli
      nodePackages.alex
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
    ./aws
    ./gcp
    ./js
  ];
}
