{ config, pkgs, ... }:

{
  imports = [
    ./development
  ];

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
  };

  programs.zsh.shellAliases = {
    r = "ranger";
    ls = "exa";
    la = "exa -la";
    l = "exa -l";
    "," = "nix-shell -p";
  };

  # PATH variables
  home.sessionPath = [ 
    "$HOME/go/bin"  
  ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.htop
    pkgs.git
    pkgs.go
    pkgs.jq
    pkgs.stow
    pkgs.wget
    pkgs.yq
    pkgs.nix-prefetch-git
    pkgs.ranger
    pkgs.exa
    pkgs.fzf
  ];
}
