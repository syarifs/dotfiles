call plug#begin()

" File Manager
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Multi Corsor
Plug 'terryma/vim-multiple-cursors'

" Snippets
Plug 'SirVer/ultisnips', {'for': ['javascript', 'php', 'vue', 'blade', 'java', 'c', 'python', 'cpp', 'html']}
Plug 'honza/vim-snippets', {'for': ['javascript', 'php', 'vue', 'blade', 'java', 'c', 'python', 'cpp', 'html']}

" Floaterm
Plug 'voldikss/vim-floaterm'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theme
Plug 'joshdick/onedark.vim'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Commentary
Plug 'tpope/vim-commentary'

" AutoPairs
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Colorizer
Plug 'chrisbra/colorizer'

" Vim Lightline
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'

" CSV Support
Plug 'chrisbra/csv.vim', {'for': ['csv']}

" Laravel Support
Plug 'jwalton512/vim-blade', {'for': ['php']}
Plug 'noahfrederick/vim-laravel', {'for': ['php']}

" Dart Support
Plug 'dart-lang/dart-vim-plugin', {'for': ['dart']}

" Better Syntax Highlight
Plug 'sheerun/vim-polyglot'

" Vim Git
Plug 'airblade/vim-gitgutter'

call plug#end()
