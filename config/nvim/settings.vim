" File type and syntax highlighting
filetype plugin on
syntax enable

" Vim setup
set number
set cursorline
set regexpengine=1
set lazyredraw
set autoindent
set tabstop=4
set shiftwidth=2
set expandtab
set mouse=a
set termguicolors
set noshowmode

" Color Scheme
colorscheme onedark

" Auto cd to Working Directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'CHADopen' | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Code of Conqueror
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-flutter',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-phpls',
  \ 'coc-tailwindcss',
  \ 'coc-vetur',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-snippets',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-clangd',
  \ 'coc-pyright',
  \ 'coc-vimlsp',
  \ 'coc-sh',
  \ 'coc-import-cost',
  \ 'coc-sql',
  \ 'coc-rls',
  \ 'coc-rust-analyzer',
  \ 'coc-tag',
  \ ]

" Airline
" let g:airline_theme='onedark'
" let g:airline_powerline_fonts = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" activate color on every buffer
autocmd BufEnter * execute 'ColorToggle'

autocmd BufEnter *.php,*.dart set shiftwidth=4

" CSV Column Highlight
hi link CSVColumnOdd MoreMsg
hi link CSVColumnEven Question

" Vim Lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left' : [['mode', 'paste'], ['filename'], ['filetype'],
      \             [  'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ]],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'charvaluehex' ] ]
      \ },
      \ }
call lightline#coc#register()

" Dart
let g:dart_style_guide = 2
let g:dart_format_on_save = 1


