func! Run()
exec "!sass %:%:t:r.css"
endfunc

map <silent> <F5> :call Run()<CR>
