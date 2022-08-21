{ config, pkgs, ... }:

{
  config = {
    home.packages = with pkgs; [
      pkgs.oh-my-zsh
      pkgs.pure-prompt
    ];

    programs.zsh = {
      enable = true;
      plugins = [
        {
          name = "zsh-vi-mode";
          src = pkgs.fetchFromGitHub {
            owner = "jeffreytse";
            repo = "zsh-vi-mode";
            rev = "9e909d0bdd0aff36ca60ea213ec92f46a554b288";
            sha256 = "1rnzgwygmy7a771n1pgw8hryrnxkagbfc9ima824g18cf5m0ks02";
          };
        }
        {
          name = "nix-zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "spwhitt";
            repo = "nix-zsh-completions";
            rev = "0.4.3";
            sha256 = "0fq1zlnsj1bb7byli7mwlz7nm2yszwmyx43ccczcv51mjjfivyp3";
          };
        }
      ];
      cdpath = [
        "$HOME/go/src/github.com/mrjerz/"
        "$HOME/code/"
      ];
      autocd = true;
      enableAutosuggestions = true;
      oh-my-zsh = {
        enable = true;
        # can i improve that? https://github.com/nix-community/home-manager/issues/1224
        theme = "robbyrussell";
        plugins = [
          "git"
          "sudo"
          "z"
        ];
      };
    };
  };
}
