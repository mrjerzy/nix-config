{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.google-cloud-sdk
    ];

    # PATH variables
    home.sessionPath = [
    ];
  };
}
