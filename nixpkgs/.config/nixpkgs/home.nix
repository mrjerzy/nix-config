{ config, pkgs, lib, ... }:

{
  imports = [
    ./development
  ];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    CFG = "$HOME/.config/nixpkgs";
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
    "," = "nix-shell -p";
    bc = "bc -l";
    cfg = "cd ~/.config/nixpkgs && vim home.nix";
    ta = "tmux attach";
    du = "dust";
    df = "duf";
    ga = "git add";
    gs = "git status";
  };

  programs.zsh.initExtra = ''
    eval "$(mcfly init zsh)"
  '';


  # PATH variables
  home.sessionPath = [ 
  ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.htop
    pkgs.git
    pkgs.jq
    pkgs.stow
    pkgs.wget
    pkgs.yq
    pkgs.nix-prefetch-git
    pkgs.ranger
    pkgs.exa
    pkgs.fzf
    pkgs.iterm2
    pkgs.du-dust
    pkgs.duf
    pkgs.mcfly
  ];
}
