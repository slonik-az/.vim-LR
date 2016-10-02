" ~/.vim/after/plugin/override.vim  is the last resort settings file which is loaded after
" this file and all the plugins. Put stuff there for final override.
" See :help 'runtimepath'

""" turn off viminfo logging
set viminfo=

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab while editing
set nosmarttab      " <TAB> inserts only tabstop or softtabstop spaces, never shiftwidth.

""" Show < or > when characters are not displayed on the left or right.
" :set list listchars=precedes:<,extends:>

