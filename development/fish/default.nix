{ config, lib, pkgs, ...}:

{
  config = {
    home.packages = with pkgs; [
      pkgs.oh-my-fish
    ];

    programs.fish = {
      enable = true;
      shellAbbrs = {
        g = "git";
        hm = "home-manager switch";
      };
      plugins = [
        {
          name = "z";
          src = pkgs.fetchFromGitHub {
            owner = "jethrokuan";
            repo = "z";
            rev = "45a9ff6d0932b0e9835cbeb60b9794ba706eef10";
            sha256 = "1kjyl4gx26q8175wcizvsm0jwhppd00rixdcr1p7gifw6s308sd5";
          };
        }
        {
           name = "gnuykeaj";
            src = pkgs.fetchFromGitHub {
              owner = "oh-my-fish";
              repo = "theme-gnuykeaj";
              rev = "17d88906f40db98d8c96c14b5ad83cfb9bb5d524";
              sha256 = "004078sbjpb15js36ynz64jnr4b0qn0kf5g7y06pvynmvr3nacnq";
            };
         }
      ];
    };
  };
}
