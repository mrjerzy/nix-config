{ config, lib, pkgs, ... }: 

{
  config = {
    # Environment Variables
    home.sessionVariables = { 
      EDITOR = "nvim";
    };


    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      inconsolata-nerdfont
    ];

    programs.neovim = { 
      enable = true; 
      viAlias = true;
      vimAlias = true;
      extraConfig = builtins.readFile ./init.vim;
      plugins = with pkgs.vimPlugins; [ 
        vim-nix
        vim-go
        { 
          plugin = markdown-preview-nvim;
          config = ''
            let g:mkdp_auto_start = 1
          '';

        }
        # Nerdtree
        {
          plugin = nerdtree;
          config = ''
            nnoremap <leader>n :NERDTreeToggle<CR>
          '';
        }
        # Telescope
        {
          plugin = telescope-nvim;
          config = ''
            nnoremap <C-P> <cmd>Telescope find_files<cr>
          '';
        }

      ];
    };
  };
}
