filetype plugin indent on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=UTF-8
set lazyredraw
set regexpengine=1
set ignorecase smartcase
set background=dark
colorscheme PaperColor

augroup ProgrammingLanguageSettings
    "the command below execute the script for the specific filetype C
    autocmd FileType c source ~/.config/nvim/language/c.vim

    "the command below execute the script for the specific filetype Java
    autocmd FileType java source ~/.config/nvim/language/java.vim

    "the command below execute the script for the specific filetype SASS
    autocmd FileType sass source ~/.config/nvim/language/sass.vim
augroup END

"Vim CPP Highlight Config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

"Vim AirLine Config
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDTREE Config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | 
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif



