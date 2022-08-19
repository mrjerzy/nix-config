{ config, pkgs, lib, ... }:

{
  # home. documentation:
  # https://github.com/nix-community/home-manager/blob/master/modules/home-environment.nix
  home.username = "wzhjeki";
  home.homeDirectory = "/Users/wzhjeki";
  home.stateVersion = "22.05";

   # Environment Variables
  home.sessionVariables = {
    CODE = "$HOME/code";
    CFG = "$HOME/code/config";
  };

  # Path variables
  home.sessionPath = [
  ];

  imports = [
    ../../os/macos/default.nix
  ];
}
