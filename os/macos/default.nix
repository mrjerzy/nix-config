{ config, pkgs, lib, ... }:

{
  # currently required on macos, as pyopenssl is broken on mac
  nixpkgs.config.allowBroken = true;

  home.packages = with pkgs; [
    iterm2
  ];
}
