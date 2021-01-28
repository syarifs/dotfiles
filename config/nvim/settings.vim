filetype plugin indent on
set smartindent
set number
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=UTF-8
set lazyredraw
set regexpengine=1
set ignorecase smartcase
set background=dark
set termguicolors

hi LineNr ctermbg=NONE guibg=NONE

colorscheme nvcode

augroup ProgrammingLanguageSettings
    "the command below execute the script for the specific filetype C
    autocmd FileType c source ~/.config/nvim/language/c.vim

    "the command below execute the script for the specific filetype Java
    autocmd FileType java source ~/.config/nvim/language/java.vim

    "the command below execute the script for the specific filetype SASS
    autocmd FileType sass source ~/.config/nvim/language/sass.vim
augroup END

let g:nvcode_termcolors=256

"Vim CPP Highlight Config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

"Vim AirLine Config
let g:airline_theme='ouo'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

" NERDTREE Config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Vim Treesitter
lua<<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" Vim NERDTree Git Plugin
let g:NERDTreeGitStatusUseNerdFonts = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
