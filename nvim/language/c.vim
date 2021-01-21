func! Run()
exec "!mkdir /tmp/vim/c/ -p"
exec "!gcc % -o /tmp/vim/c/%:t:r"
exec ":cd /tmp/vim/c"
exec "!time ./%:t:r"
endfunc

map <silent> <F5> :call Run() <CR>
