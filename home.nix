{ config, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

{
  imports = [
    ./development
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  # Let home-manager install and manage itself.
  programs.home-manager.enable = true;

  # man home-configuration.nix
  manual.manpages.enable = true;
  manual.html.enable = true;

  # home. documentation:
  # https://github.com/nix-community/home-manager/blob/master/modules/home-environment.nix
  home.username = "jerzy";
  home.homeDirectory = "/Users/jerzy";
  home.stateVersion = "22.05";

  # Environment Variables
  home.sessionVariables = {
    K9S_EDITOR = "$HOME/.nix-profile/bin/vim";
    NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels";
    CFG = "$HOME/dotfiles";
    CODE = "$HOME/Documents/code";
  };

  # Install Flake Support
  lib.nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

  programs.zsh.shellAliases = {
    r = "ranger";
    ls = "exa";
    la = "exa -la";
    l = "exa -l";
    "," = "nix shell nixpkgs#";
    bc = "bc -l";
    cfg = "cd ~/dotfiles/ && vim home.nix";
    ta = "tmux attach";
    du = "dust";
    df = "duf";
    ga = "git add";
    gs = "git status";
    vim = "nvim";
  };

  # Add statements to .zshrc
  programs.zsh.initExtra = ''
    # some command
  '';

  # PATH variables
  home.sessionPath = [
    "$HOME/.platformio/penv/bin"
  ];

  home.packages = with pkgs; [
    htop
    git
    jq
    stow
    wget
    yq
    nix-prefetch-git
    ranger
    exa
    fzf
    iterm2
    du-dust
    duf
  ];
}
