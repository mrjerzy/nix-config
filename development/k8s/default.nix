{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.k9s
      pkgs.kubectl
      pkgs.minikube
      pkgs.kustomize
    ];

    home.sessionVariables = {
    };
  };
}
