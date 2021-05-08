" Basic Shortcut
nnoremap <silent> <C-S-Up>    :resize -2<CR>
nnoremap <silent> <C-S-Down>  :resize +2<CR>
nnoremap <silent> <C-S-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-S-Right> :vertical resize +2<CR>
nnoremap <silent> <A-q> :qa<CR>
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> q :bdelete<CR>
nnoremap <silent> s :w!<CR>
nnoremap <silent> u :undo<CR>
nnoremap <silent> z :redo<CR>

" Commentary
inoremap <silent> <A-/> <ESC>:Commentary<CR>i
nnoremap <silent> <A-/> :Commentary<CR>
vnoremap <silent> <A-/> :Commentary<CR>


" File Manager
nnoremap <silent> <C-f> :NvimTreeToggle<CR>
nnoremap <silent> <C-r> :NvimTreeRefresh<CR>
nnoremap <silent> <C-F> :NvimTreeFindFile<CR>

" Copy to Clipboard (xclip required)
vnoremap <silent> <C-c> "+y
vnoremap <silent> <C-v> "+p
nnoremap <silent> <C-v> "+p
inoremap <silent> <C-v> <ESC>"+pi

" Better Buffer Movement
nmap <silent> <A-Up> <C-W>k
nmap <silent> <A-Left> <C-W>h
nmap <silent> <A-Right> <C-W>l
nmap <silent> <A-Down> <C-W>j

" Tab Support
nmap <silent> <A-S-Left> :bprevious<CR>
nmap <silent> <A-S-Right> :bnext<CR>

" Tab Completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Multiline Indentation
vnoremap <S-Tab> <
vnoremap <Tab> >

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Code of Conqueror
nnoremap <silent> cr :CocRestart<CR>
nnoremap <silent> ca :CocAction<CR>
nnoremap <silent> cc :CocCommand<CR>

" show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Floating Terminal
nnoremap <silent> <A-t> :FloatermNew <CR>
tnoremap <silent> <A-t> <C-\><C-n>:FloatermKill<CR>

" Find files using Telescope command-line sugar.
nnoremap <silent>ff <cmd>Telescope find_files<CR>
nnoremap <silent>fg <cmd>Telescope live_grep<CR>
nnoremap <silent>fb <cmd>Telescope buffers<CR>
nnoremap <silent>fh <cmd>Telescope help_tags<CR>
