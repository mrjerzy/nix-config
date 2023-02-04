{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.k9s
      pkgs.kubectl
      pkgs.minikube
      pkgs.kustomize
      pkgs.kubectx
      pkgs.argocd
      pkgs.kubernetes-helm
      pkgs.kubeseal
      unixtools.watch
    ];

    programs.zsh.shellAliases = {
      k = "kubectl";
      kgd = "kubectl get deploy";
      kgp = "kubectl get pod";
      kg = "kubectl get";
      kd = "kubectl describe";
      ke = "kubectl explain";
      ker = "kubectl explain --recursive";
      ka = "kubectl apply -f";
    };

    home.sessionVariables = {
    };

    programs.zsh.initExtra = ''
      source <($HOME/.nix-profile/bin/kubectl completion zsh)    
      source <($HOME/.nix-profile/bin/kustomize completion zsh)    
      source <($HOME/.nix-profile/bin/argocd completion zsh)    
      source <($HOME/.nix-profile/bin/helm completion zsh)    

      # Kubernetes Commands
      dy=(--dry-run=client -o yaml)
      y=(-o yaml)
    '';
  };
}
