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
        theme = "base16_default";
        editor.file-picker.hidden = false;
        editor.line-number = "relative";
        editor.cursor-shape.insert = "bar";
        keys.normal = {
          space.space = "file_picker";
          ",".q = ":q";
          ",".w = ":w";
          "0" = "goto_line_start";
          "`" = "keep_primary_selection";

          # Update configuration with home-manager
          ","."`" = ":run-shell-command home-manager switch --flake $NIX_MACHINE_CFG --extra-experimental-features nix-command --extra-experimental-features flakes";
        };
      };
    };
  };
}
