{ config, lib, pkgs, ...}:

{
  config = {

    # packages
    home.packages = with pkgs; [
      pkgs.maven
      pkgs.jdk
      # pkgs.jdk11
    ];

    # ENV variables
    home.sessionVariables = {
      JAVA_HOME = "$HOME/.nix-profile/";
    };

    # PATH variables
    home.sessionPath = [
    ];
  };
}
