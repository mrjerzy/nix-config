{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.awscli
    ];

    # PATH variables
    home.sessionPath = [
    ];

    programs.zsh.initExtra = ''
      complete -C "$HOME/.nix-profile/bin/aws_completer" aws
    '';

  };
}
