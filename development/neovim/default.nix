{ config, lib, pkgs, ... }:

{
  config = {
    # Environment Variables
    home.sessionVariables = {
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
          plugin = dracula-nvim;
          config = ''
            colorscheme dracula
          '';
        }
        supertab
        rainbow
        vim-nix
        vim-go
        vim-airline
        vim-cursorword
        vim-css-color
        vim-gitgutter
        vim-fugitive
        clever-f-vim
        editorconfig-nvim
        vim-terraform
        gotests-vim
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
          plugin = nvim-treesitter;
          config = ''
            lua <<EOF
            require'nvim-treesitter.configs'.setup {
              parser_install_dir = "$HOME/.local/share/nvim/site";
              auto_install = true;

              highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
              };

              ensure_installed = {
                "bash",
                "c",
                "diff",
                "dockerfile",
                "dot",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gowork",
                "haskell",
                "html",
                "http",
                "java",
                "json",
                "jsonnet",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "mermaid",
                "org",
                "python",
                "r",
                "rst",
                "rust",
                "sql",
                "terraform",
                "toml",
                "vim",
                "yaml"
              }
            }
            EOF
          '';
        }
        nvim-treesitter-context
        {
          plugin = nvim-cmp;
          config = ''
          lua <<EOF
          require'cmp'.setup {
            }
          EOF
          '';
        }
        nvim-treesitter-context
        {
          plugin = nvim-treesitter;
          config = ''
          lua <<EOF
            require'cmp'.setup {
              sources = {
                { name = 'treesitter' }
              }
            }
          EOF
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
          plugin = pkgs.vimUtils.buildVimPluginFrom2Nix {
            pname = "nvim-scrollbar";
            version = "2022-02-26";
            src = pkgs.fetchFromGitHub {
              owner = "petertriho";
              repo = "nvim-scrollbar";
              rev = "6a2065fbcd032075a06d2ab54508b69842bc4496";
              sha256 = "0IwTzVgYi2Z7M2+vJuP+lrKVrTOBWdrIi3mtsj0E+wg=";
            };
          };
          config = ''
            lua require("scrollbar").setup()
          '';
        }
       ];
    };
  };
}
