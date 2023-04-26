{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.nodejs
      yarn
    ];

    # PATH variables
    home.sessionPath = [
    ];
  };
}
