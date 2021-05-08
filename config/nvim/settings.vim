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

" Nvim Tree Setup
let g:nvim_tree_auto_open = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_quit_on_open = 1


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
  \ 'coc-vimlsp',
  \ 'coc-sh',
  \ 'coc-import-cost',
  \ 'coc-sql',
  \ 'coc-rls',
  \ 'coc-python',
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


