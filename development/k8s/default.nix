{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.k9s
      pkgs.kubectl
      pkgs.minikube
    ];

    home.sessionVariables = {
      K9S_EDITOR = "$HOME/.nix-profile/bin/vim";
    };
  };
}
