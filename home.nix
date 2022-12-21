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
    K9S_EDITOR = "$HOME/.nix-profile/bin/vim";
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
    ls = "exa";
    la = "exa -la";
    l = "exa -l";
    "," = "nix shell nixpkgs#";
    bc = "bc -l";
    cfg = "cd $CFG && hx home.nix";
    ta = "tmux attach";
    du = "dust";
    df = "duf";
    ga = "git add";
    gs = "git status";
    vim = "nvim";
    cb = "nvim $HOME/.bookmarks";

    # bookmarks
    s = "bookmarks add";
    u = "bookmarks update";
    r = "bookmarks remove";
  };

  # Add statements to .zshrc
  programs.zsh.initExtra = ''
    # bookmarks
    c() { cd `bookmarks get $1` }
  '';

  # PATH variables
  home.sessionPath = [
    "$HOME/.platformio/penv/bin"
    # required, as nix-profile disapears from PATH. Not sure
    # what causes it.
    "$HOME/.nix-profile/bin"
  ];

  home.packages = with pkgs; [
    htop
    git
    jq
    stow
    wget
    yq
    nix-prefetch-git
    exa
    fzf
    iterm2
    du-dust
    duf
    nix
  ];
}
