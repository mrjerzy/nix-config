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
      pkgs.cilium-cli
      pkgs.clusterctl
      unixtools.watch
    ];

    programs.zsh.shellAliases = {
      k = "kubectl";
      ke = "kubectl explain";
      ker = "kubectl explain --recursive";
      ka = "kubectl apply -f";
      wk = "watch -n 1 kubectl";
      kn = "f() { [ \"$1\" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d\" \" -f6 ; } ; f";
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
