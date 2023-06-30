{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.go
      pkgs.gocode
      pkgs.godef
      pkgs.gotests
    ];

    # PATH variables
    home.sessionPath = [
      "$HOME/go/bin"
    ];
  };
}
