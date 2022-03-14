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
  ];
}
