func! Run()
exec "!javac % -d /tmp/vim/java/"
exec ":cd /tmp/vim/java"
exec ":FloatermNew java %:t:r"
endfunc

map <silent> <F5> :call Run()<CR>
