{ config, lib, pkgs, ...}:

{
  config = {

    # packages
    home.packages = with pkgs; [
      pkgs.rustup
      pkgs.rust-analyzer
    ];

    # ENV variables
    home.sessionVariables = {
    };

    # PATH variables
    home.sessionPath = [
    ];
  };
}
