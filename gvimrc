""" GUI specific settings for gvim
""" ------------------------------

""" Preamble        {{{1

" My gvim autocmd group defined and cleared here
augroup LR_gvim
  autocmd!
augroup END

" }}}1

""" Theme       {{{

" colorscheme lr-light

" set background=dark
" colorscheme koehler
"" <!LR> favorite dark background colorscheme
" colorscheme vividchalk
" Switch syntax highlighting on, when the terminal has colors
" syntax on
" Trying to undercurl misspelled words in help, tex filetypes.
" syntax spell toplevel

" }}}

""" Set fonts       {{{

" set guifont=Cousine\ for\ Powerline:h17
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:h19
" set guifont=Literation\ Mono\ Powerline:h17
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16
" set guifont=Source\ Code\ Pro\ Semibold:h16
set guifont=DejaVu\ Sans\ Mono\ Bold\ for\ Powerline:h15
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16
" set guifont=Menlo\ Regular:h16

set printfont=courier:h9

" }}}

""" Key mappings for gvim       {{{

" Convenient mappings to scroll window up/down
noremap <M-Down> 3<C-E>
noremap <M-Up> 3<C-Y>
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
    " free command-f, command-g, shift-command-g
    macmenu Edit.Find.Find\.\.\. key=<nop>
    macmenu Edit.Find.Find\ Next key=<nop>
    macmenu Edit.Find.Find\ Previous key=<nop>
    " free command-l
    macmenu Tools.List\ Errors key=<nop>
    " free command-b
    macmenu Tools.Make key=<nop>
    " To free comand-, using System Preferences->Keyboard->Shortcuts->App Shortcuts.
    """ Command-key mappings
    " Vertical scrolling in NORMal, Visual modes
    noremap <D-Down> <C-E>
    noremap <D-j>    <C-E>
    noremap <D-Up>   <C-Y>
    noremap <D-k>    <C-Y>
    nnoremap <D-3> :nohlsearch<cr>
    inoremap <D-3> <C-o>:nohlsearch<cr>
    " and scrolling in insert mode
    inoremap <D-Down> <C-X><C-E>
    inoremap <D-j>    <C-X><C-E>
    inoremap <D-Up>   <C-X><C-Y>
    inoremap <D-k>    <C-X><C-Y>
    " Horizontal scrolling in Normal, Visual modes
    noremap <D-M-Left>  zh
    noremap <D-M-Right> zl
    noremap <D-M-Up>    zH
    noremap <D-M-Down>  zL
    """ Alternative <Esc>
    inoremap <D-Space> <Esc>
    noremap  <D-Space> <Esc>
endif
" }}}

" vim:fdm=marker:fdl=0:sw=4:
