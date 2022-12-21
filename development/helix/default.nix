{ config, lib, pkgs, ...}:

{
  config = {

    # packages
    home.packages = with pkgs; [
      pkgs.helix
    ];

    # ENV variables
    home.sessionVariables = {
    };

    # PATH variables
    home.sessionPath = [
    ];

    programs.helix = {
      enable = true;
      settings = {
        theme = "base16_terminal";
        keys.normal = {
          space.space = "file_picker";
          ",".q = ":q";
          ",".w = ":w";
          "0" = "goto_line_start";
        };
      };
    };
  };
}
