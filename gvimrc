""" GUI specific settings for gvim
""" Theme
set background=dark
" colorscheme koehler
colorscheme vividchalk
" Switch syntax highlighting on, when the terminal has colors
" syntax on
" Trying to undercurl misspelled words in help, tex filetypes.
" syntax spell toplevel

""" Set fonts       {{{
" set guifont=Cousine\ for\ Powerline:h17
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:h19
" set guifont=Literation\ Mono\ Powerline:h17
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16
" set guifont=Menlo\ Regular:h16
" }}}

""" Set colors & highlighting       {{{
""" Highlight the line where cursor is (aka current line)
set cursorline
" set cursorcolumn
hi CursorLine  gui=bold guibg=Grey20
" hi CursorColumn gui=bold guibg=darkred guifg=white
hi CursorLineNr gui=bold guifg=#000088 guibg=#f08000

""" Folded line colors
hi Folded  gui=bold guifg=White guibg=Brown
" hi Folded  gui=bold guifg=#ffffff  guibg=#ea5500

""" Colors for Visual mode selection
" hi Visual  guibg=grey50 gui=reverse
" hi Visual  guibg=grey33 gui=none
hi Visual  guifg=#000000 guibg=#FFFFFF gui=none

""" Syntax highllight for open fold headers
" hi hiLR  gui=bold  guifg=black  guibg=LightRed
" hi hiLR   gui=bold guifg=Yellow guibg=DarkBlue
hi hiLR gui=bold guifg=#ffff00 guibg=#0000cc
hi hiLR2  gui=bold guifg=White guibg=Brown
" hi hiLR2  gui=bold guifg=White guibg=DarkRed

function! LR_Syntax_hi(ft)
    syntax match hiLR /\m^\(##\|\/\/\|\/\*\|%%\|--\)*[ *#=~+-]*|>.*$/ containedin=ALL
    if(a:ft == "tex")
      syntax match hiLR /\m^.*\(<<<\|>>>\).*$/ containedin=ALL
      syntax spell toplevel " highlight misspelings
    else
      syntax match hiLR /\m^.*\({{{\|}}}\).*$/ containedin=ALL
      if(a:ft == "help")
        syntax spell toplevel " highlight misspelings
      endif
    endif
endfunction

augroup augLRsyn
  autocmd!
  autocmd Syntax * call LR_Syntax_hi(&ft)
  autocmd Filetype tex set foldmarker=<<<,>>>
  " autocmd Syntax * syntax match hiLR2 /\m^.*\({{{\|}}}\).*$/ containedin=ALL
  " autocmd Syntax * syntax match hiLR2 /\m^\(##\|\/\/\|\/\*\|%%\|--\)*[ *#=~+-]*|>.*$/ containedin=ALL
  " autocmd Syntax * syntax match Folded /^\(##\|\/\/\|\/\*\|%%\|--\)*[ *#=~+-]*|>.*$\|^.*\({{{\|}}}\).*$/
augroup END

" }}}

""" Key mappings for gvim       {{{

" Convenient mappings to scroll window up/down
noremap <M-Down> <C-E>
noremap <M-Up> <C-Y>
noremap <C-Q> <C-Y>
noremap <S-Down> 3j
noremap <S-Up> 3k
  " and scrolling in insert mode
inoremap <M-Down> <C-X><C-E>
inoremap <M-Up> <C-X><C-Y>
inoremap <S-Down> <C-o>3j
inoremap <S-Up> <C-o>3k

" }}}

" MacOSX specific settings    {{{
if  has('gui_macvim')
    set macmeta
    " free command-w
    macmenu File.Close key=<nop>
    " free command-p
    macmenu File.Print key=<nop>
    " free command-l
    macmenu Tools.List\ Errors key=<nop>
    " free command-b
    macmenu Tools.Make key=<nop>
    " To free comand-, using System Preferences->Keyboard->Shortcuts->App Shortcuts.
    " Command-key mappings
    noremap <D-Down> 3<C-E>
    noremap <D-Up> 3<C-Y>
    nnoremap <D-3> :nohlsearch<cr>
    """ Alternative <Esc>
    inoremap <D-Space> <Esc>
    noremap <D-Space> <Esc>
endif
" }}}

" vim:fdm=marker:fdl=0:
