{ config, lib, pkgs, ... }:

{
  config = {
    # Environment Variables
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    fonts.fontconfig.enable = true;

    lib = {
      fonts = {
        enableDefaultsFonts = true;
        fonts = with pkgs; [
          nerdfonts
        ];
      };
    };

    home.packages = with pkgs; [
      inconsolata-nerdfont
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = builtins.readFile ./init.vim;
      extraPackages = with pkgs; [
        # for LSP
        gopls
      ];
      plugins = with pkgs.vimPlugins; [
        {
          plugin = molokai;
          config = ''
            colorscheme molokai
          '';
        }
        papercolor-theme      # theme
        rainbow
        vim-nix
        vim-go
        vim-airline
        vim-cursorword
        vim-css-color
        clever-f-vim
        editorconfig-nvim
        {
          plugin = markdown-preview-nvim;
          config = ''
            let g:mkdp_auto_start = 1
          '';
        }
        {
          plugin = pkgs.vimUtils.buildVimPlugin {
            pname = "md-img-paste";
            version = "2022-03-17";
            src = pkgs.fetchFromGitHub {
              owner = "ferrine";
              repo = "md-img-paste.vim";
              rev = "0d0b4a22bea29dc5eeafd271e6fbe3023933b753";
              sha256 = "057ifbdrb0mvm84166p8ph9dskfwa3zvd439j1v2mm9sw15mqhmj";
            };
          };
          config = ''
            autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
          '';
        }
        {
          plugin = comment-nvim;
          config = ''
            lua require('Comment').setup()
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
            nnoremap <C-B> <cmd>Telescope buffers<cr>
            nnoremap <C-H> <cmd>Telescope help_tags<cr>
            nnoremap <C-F> <cmd>Telescope treesitter<cr>
          '';
        }
        {
          plugin = nvim-web-devicons;
          config = ''
            lua require'nvim-web-devicons'.setup()
          '';
        }
        {
          plugin = nvim-treesitter;
          config = ''
            lua <<EOF
            require('nvim-treesitter.configs').setup {
              ensure_installed = {
                "bash",
                "go",
                "gomod",
                "gowork",
                "json",
                "lua",
                "make",
                "markdown",
                "toml",
                "typescript",
                "vim",
                "yaml",
              },
              highlight = {
                  enable = true,
              }
            }
            EOF
            '';
        }
        {
          plugin = pkgs.vimUtils.buildVimPluginFrom2Nix {
            pname = "nvim-scrollbar";
            version = "2022-02-26";
            src = pkgs.fetchFromGitHub {
              owner = "petertriho";
              repo = "nvim-scrollbar";
              rev = "b10ece8f991e2c096bc2a6a92da2a635f9298d26";
              sha256 = "0IwTzVgYi2Z7M2+vJuP+lrKVrTOBWdrIi3mtsj0E+wg=";
            };
          };
          config = ''
            lua require("scrollbar").setup()
          '';
        }
        # LSP & Autocompletition
        nvim-lspconfig
        lspkind-nvim
        cmp-buffer
        cmp-path
        cmp-cmdline
        luasnip
        cmp_luasnip
        cmp-nvim-lsp
        {
          plugin = nvim-cmp;
          config = builtins.readFile ./completition.lua;
        }
       ];
    };
  };
}
