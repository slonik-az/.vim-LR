" ~/.vim/after/plugin/override.vim  is the last resort settings file which is loaded after
" vimrc file and all the plugins. Put stuff there for final override.
" See :help 'runtimepath'

""" turn off viminfo logging
set viminfo=

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab while editing
set nosmarttab      " <TAB> inserts only tabstop or softtabstop spaces, never shiftwidth.

" The number of spaces inserted by shift operators > and < and by <TAB> in the beginning of line if
" smarttab is on.
set shiftwidth=0

""" Show < or > when characters are not displayed on the left or right.
" :set list listchars=precedes:<,extends:>

""" vim-HiLinkTrace: trace syntax stack, show hilight info
" Unmap key binding. Use the command :HLT instead!
unmap <Leader>hlt

