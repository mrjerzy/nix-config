{ config, lib, pkgs, ...}:

{
  config = {

    # packages
    home.packages = with pkgs; [
      pkgs.rustup
    ];

    # ENV variables
    home.sessionVariables = {
    };

    # PATH variables
    home.sessionPath = [
    ];
  };
}
