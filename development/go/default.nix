{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.go
      pkgs.gocode
      pkgs.godef
    ];

    # PATH variables
    home.sessionPath = [
      "$HOME/go/bin"
    ];
  };
}
