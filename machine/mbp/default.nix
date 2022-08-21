{ config, pkgs, lib, ... }:

{
  # home. documentation:
  # https://github.com/nix-community/home-manager/blob/master/modules/home-environment.nix
  home.username = "jerzy";
  home.homeDirectory = "/Users/jerzy";
  home.stateVersion = "22.05";

   # Environment Variables
  home.sessionVariables = {
    CODE = "$HOME/code";
    NIX_MACHINE = "mbp";
  };

  # Path variables
  home.sessionPath = [
  ];

  imports = [
    ../../os/macos/default.nix
  ];
}
