{ config, lib, pkgs, ... }:

{
  config = {
    programs.tmux = {
      enable = true;

      # Recommended by tmux-tilish
      baseIndex = 1;
      escapeTime = 0;

      plugins = with pkgs.tmuxPlugins; [
        {
          # This plugin requires iTerm to be configured
          # Profiles -> Keys -> General -> Left Options Key -> Esc+
          plugin = tilish;
          extraConfig = ''
            set -g @tilish-navigate 'on'
            set -g @tilish-default 'main-vertical'
            set -g @tilish-shiftnum '!@#$%^&*()'
            set -g mouse on
          '';
        }
      ];
      extraConfig = ''
      '';
    };
  };
}
