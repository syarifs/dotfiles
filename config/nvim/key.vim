nnoremap <silent> <C-S-Up>    :resize -2<CR>
nnoremap <silent> <C-S-Down>  :resize +2<CR>
nnoremap <silent> <C-S-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-S-Right> :vertical resize +2<CR>
nnoremap <silent> <A-q> :qa<CR>
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> q :bdelete<CR>
nnoremap <silent> s :w<CR>
nnoremap <silent> u :undo<CR>
nnoremap <silent> z :redo<CR>
nnoremap <silent> f :NERDTreeToggle<CR>

" shortcut comentary
vnoremap <C-c> :Commentary<CR>
nnoremap <C-c> :Commentary<CR>

" Move TabLine
nnoremap <silent> <C-A-Left> :bprevious<CR>
nnoremap <silent> <C-A-Right>   :bnext<CR>

" Shortcut for Floaterm
nnoremap <silent> <C-f> :FloatermNew fzf<CR>
nnoremap <silent> <C-g> :FloatermNew<CR>
nnoremap <silent> <C-x> :FloatermNew lf<CR>

" shortcut for tagbar
nnoremap <silent> tt :TagbarToggle<CR>

" shortcut for coc.nvim
nnoremap <silent> or :CocRestart<CR>
nnoremap <silent> oa :CocAction<CR>
nnoremap <silent> oc :CocCommand<CR>

" shortcut for far.vim find
nnoremap <silent> <C-A-f>  :Farf<cr>
vnoremap <silent> <C-A-f>  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <A-f>  :Farr<cr>
vnoremap <silent> <A-f>  :Farr<cr>
