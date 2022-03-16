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
      extraConfig = ''
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "" General 
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set number
        set tabstop=2
        set shiftwidth=2
        set expandtab
        let mapleader = ","                     " defines default key for <leader>
        syntax on                               " Activate Syntax highlighting
        set history=500                         " number of undos
        set clipboard=unnamedplus               " use the system clipboard
        set showmatch                           " Show matching brackets
        set noswapfile                          " do not create swap files
        set relativenumber                      " show relative numbering of lines
        set mouse=a                             " enable mouse support in all modes
        set cursorline                          " show an underline, where the cursor is
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Key Mappings
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " toggle show numbers
        nnoremap <f2> :set number!<cr>:set relativenumber!<cr>
        " saving files
        noremap <leader>w :w!<cr>
        noremap <leader>q :q<cr>
        " Reload vim Configuration
        noremap <leader>r :source $HOME/.config/nvim/init.vim<cr>
        noremap <leader><esc> :tabnew<cr>:e $HOME/.config/nixpkgs/home.nix<cr>
        " split windows
        noremap <leader>z :split<cr>
        noremap <leader>x :vsplit<cr>
        " move split panes to left/bottom/top/right
        nnoremap ˙ <C-W>H
        nnoremap ∆ <C-W>J
        nnoremap ˚ <C-W>K
        nnoremap ¬ <C-W>L
        " move between panes to left/bottom/top/right
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l
        " Generate home-manager config 
        nnoremap <leader>` :!home-manager switch<cr>
        " Open Terminal
        nnoremap <leader>t :tabnew<cr>:term<cr>
        " Tabs
        nnoremap <leader><leader> :tabprevious<cr>
        nnoremap <leader>. :tabnext<cr>
        nnoremap <leader>m :tabnew<cr>
      '';
      plugins = with pkgs.vimPlugins; [ 
        vim-nix
        vim-go
        markdown-preview-nvim
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
