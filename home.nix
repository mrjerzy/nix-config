{ config, pkgs, lib, ... }:

{
  imports = [
    ./development
  ];

  nixpkgs.config.allowUnfree = true;

  # Let home-manager install and manage itself.
  programs.home-manager.enable = true;

  # man home-configuration.nix
  manual.manpages.enable = true;
  manual.html.enable = true;

  # Environment Variables
  home.sessionVariables = {
    K9S_EDITOR = "$HOME/.nix-profile/bin/nvim";
    EDITOR = "$HOME/.nix-profile/bin/nvim";
    NIX_PATH = "$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels";
    CFG = "$HOME/nix-config/";
    NIX_MACHINE_CFG = "$CFG#$NIX_MACHINE";
  };

  # Install Flake Support
  lib.nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

  programs.zsh.shellAliases = {
    nix = "nix --extra-experimental-features nix-command --extra-experimental-features flakes";
    ls = "exa";
    la = "exa -la";
    l = "exa -l";
    "," = "nix shell nixpkgs#";
    bc = "bc -l";
    cfg = "cd $CFG && nvim home.nix";
    ta = "tmux attach";
    du = "dust";
    df = "duf";
    ga = "git add";
    gs = "git status";
    vim = "nvim";
    cb = "nvim $HOME/.bookmarks";

    # bookmarks
    a = "bookmarks add";
    u = "bookmarks update";
    r = "bookmarks remove";
  };

  # Add statements to .zshrc
  programs.zsh.initExtra = ''
    # bookmarks
    c() { cd `bookmarks get $1` }

    # fzf
    source $HOME/.nix-profile/share/fzf/key-bindings.zsh
  '';

  programs.zsh.loginExtra = ''
    bindkey "^R" fzf-history-widget
  '';

  # PATH variables
  home.sessionPath = [
    # Jbang Binaries
    "$HOME/.jbang/bin"
    # Platformio
    "$HOME/.platformio/penv/bin"
    # required, as nix-profile disapears from PATH. Not sure
    # what causes it.
    "$HOME/.nix-profile/bin"
    # Home Brew
    "/opt/homebrew/bin"
    # Docker Desktop
    "/Applications/Docker.app/Contents/Resources/bin"
  ];

  home.packages = with pkgs; [
    htop
    git
    jq
    stow
    wget
    yq
    nix-prefetch-git
    eza
    fzf
    iterm2
    du-dust
    duf
    nix
    tree
    ansible
    fzf
  ];
}
