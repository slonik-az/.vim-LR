""" Autodetect *.lyx files

""" LyX files syntax. See ~/.vim/syntax/lyx.vim
autocmd BufRead,BufNewFile *.lyx set filetype=lyx syntax=lyx foldmethod=syntax
" autocmd BufRead *.lyx syntax sync fromstart

