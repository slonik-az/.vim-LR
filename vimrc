""" <!LR> PRE-config  {{{

""" turn off viminfo logging
set viminfo=

""" Map <Leader> key
let mapleader="\<Space>"

" map <D-,> :call cursor(0, (virtcol('$')+2)/4)<CR>
" map <M-.> :call cursor(0, (virtcol('$')+1)/2)<CR>
" map <D-/> :call cursor(0, (virtcol('$')*3+2)/4)<CR>
" imap <D-,> <C-o>:call cursor(0, (virtcol('$')+2)/4)<CR>
" imap <M-.> <C-o>:call cursor(0, (virtcol('$')+1)/2)<CR>
" imap <D-/> <C-o>:call cursor(0, (virtcol('$')*3+2)/4)<CR>

inoremap <C-Space> <C-o>
nnoremap <C-Space> <Esc>

""" Set mandatory number of context lines around the cursor
set scrolloff=0

""" Default textwidth
set tw=104

""" Enable spelling by default. Disable on per-file basis via modeline nospell
:setlocal spell spelllang=en_us

""" }}}
" ---------------------------------------------------------------------------- "

" Settings {{{
" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" Backup files settings
set backup
set writebackup
set swapfile
" set nobackup
" No write backup
" set nowritebackup
" No swap file
" set noswapfile

" Command history
set history=100

" Always show cursor line and column
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

""" Turn word wrap on/off
set wrap lbr    " wrap between words on linebreak
" set nowrap    " turn wrap off

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" The number of spaces inserted by shift operators > and < and by <TAB> in the beginning of line if
" smarttab is on.
set shiftwidth=0

" Turn on line numbers
set number

" Highlight trailing whitespace
" See issue: https://github.com/Integralist/ProVim/issues/4
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=3000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
" set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu
set wildmode=list:longest,full

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
" autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
" set colorcolumn=80

""" Allow dash in keywords like "upper-case"
set iskeyword+=-

""" LaTeX modes
" enable folding by section. In *.tex file modeline put vim:fdm=syntax:
let g:tex_flavor='latex'
let g:Tex_Flavor='latex'
let g:tex_fold_enabled=1
" let g:tex_nospell=0

" }}}

" Plugins {{{
" Activate Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Theme
" set background=light
" colorscheme Tomorrow-Night
set background=dark
colorscheme koehler

""" netrw:
" Set built-in file system explorer to use layout similar to the NERDTree plugin
" let g:netrw_liststyle=3
let g:netrw_liststyle=1
" Kill (wipe) gratuitous netrw buffers:
" autocmd FileType netrw setl bufhidden=wipe

""" CtrlP
map <leader>d :CtrlPDir
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30

" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" CtrlP -> use Ag for searching instead of VimScript
" (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'

" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'

""" Airline (status line)
let g:airline_theme='darkLR'
if has("gui_running")
   let g:airline_powerline_fonts = 1
else
   let g:airline_powerline_fonts = 0
endif
" enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 0

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" Related plugins:
" https://github.com/mattn/webapi-vim
" https://github.com/vim-scripts/Gist.vim
" https://github.com/tpope/vim-fugitive

" HTML generation using 'emmet-vim'
" NORMAL mode Ctrl+y then , <C-y,>

""" Git gutter
" let g:gitgutter_enabled = 1
" let g:gitgutter_eager = 0
" let g:gitgutter_sign_column_always = 1
" highlight clear SignColumn

""" NERDTree
let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst=1
let NERDTreeShowLineNumbers=1
" Searching the file system
map <leader>' :NERDTreeToggle<cr>

""" Tabularize
map <Leader>e :Tabularize /=<cr>
map <Leader>c :Tabularize /:<cr>
map <Leader>es :Tabularize /=\zs<cr>
map <Leader>cs :Tabularize /:\zs<cr>

""" CamelCaseMotion (for dealing with programming code)
map <silent> <M-w> <Plug>CamelCaseMotion_w
map <silent> <M-e> <Plug>CamelCaseMotion_e
map <silent> <M-b> <Plug>CamelCaseMotion_b
sunmap <M-w>
sunmap <M-e>
sunmap <M-b>
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
" sunmap e

""" Indentwise settings
map <C-S-Up> <Plug>(IndentWisePreviousEqualIndent)
sunmap <C-S-Up>
map <C-S-Down> <Plug>(IndentWiseNextEqualIndent)
sunmap <C-S-Down>
map <C-S-Left> <Plug>(IndentWisePreviousLesserIndent)
sunmap <C-S-Left>
map <C-S-Right> <Plug>(IndentWiseNextGreaterIndent)
sunmap <C-S-Right>

""" vim-latex AKA latex-suite
" Disable folding in latex-suite plugin
let g:Tex_Folding=0
" let g:Tex_FoldedEnvironments=''
let g:Tex_ViewRule_pdf='pdf'
let g:Tex_ViewRule_pdf='Skim'
" Use <Leader>ls to forward search. Jump from *.tex ==> *.pdf.

""" Colorizer plugin
" Disable on startup because it is sloe.
" Use <leader>tc  to toggle on/off manually.
let g:colorizer_startup = 0

" }}}

" Commands, Functions {{{

""" <!LR> function to move cursor postion in all modes
function! s:LR_move_cursor(new_pos, isVisual)
  if a:isVisual
    normal! gv
  endif
  call cursor(0, a:new_pos)
endfunction

""" Set window-local pwd to one of the current file
autocmd BufEnter * silent! lcd %:p:h

" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
" autocmd BufWritePre * call StripTrailingWhitespace()

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=88
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=4 expandtab

" specify syntax highlighting for specific files
autocmd BufRead,BufNewFile *.note,*.notes setfiletype text
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

""" Close all folds when opening a new buffer
" autocmd BufRead * setlocal foldmethod=marker
" autocmd BufRead * normal zM

""" Initial folding method (fdm) and folding level (fdl) settings:
set fdm=indent fdl=111

" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif

""" List all marker folds in a 'Quickfix List' and jump into it
nmap <Leader>f :vimgrep /\m{{{\\|<<</ %<CR>:copen<CR>
""" List all LR headers in a 'Quickfix List' and jump into it
nmap <Leader>h :vimgrep /\m^[ /\|%*#=~+-]*\|>.*$/ %<CR>:copen<CR>
""" List LR headers & folds:
nmap <Leader>F :vimgrep /\m{{{\\|<<<\\|\(^[ /\|%*#=~+-]*\|>.*$\)/ %<CR>:copen<CR>
nmap <Leader>H :vimgrep /\m\(^[ /\|%*#=~+-]*\|>.*$\)\\|{{{\\|<<</ %<CR>:copen<CR>

""" QuickFix window does not resize with <C-W>= or <C-W>0
" because of winfixheight setting. Fix it:
augroup LR_quickfix
  autocmd!
  autocmd FileType qf setlocal nowinfixheight
augroup END

" }}}1

" Mappings {{{
" Notes...
"
" :map     j gg (j will be mapped to gg)
" :map     Q j  (Q will also be mapped to gg, because j will be expanded -> recursive mapping)
" :noremap W j  (W will be mapped to j not to gg, because j will not be expanded -> non recursive)
"
" These mappings work in all modes. To have mappings work in only specific
" modes then denote the mapping with the mode character.
"
" e.g.
" to map something in just NORMAL mode use :nmap or :nnoremap
" to map something in just VISUAL mode use :vmap or :vnoremap

""" Cursor movements, scrolling
noremap <C-a> <C-u>
noremap <C-Down> <C-d>
noremap <C-Up> <C-u>

""" <!LR> Map quick line positions:
  " Move to Half-line position
nnoremap <silent> <M-.> :call      <SID>LR_move_cursor( virtcol('$')/2, 0)<CR>
inoremap <silent> <M-.> <C-o>:call <SID>LR_move_cursor( virtcol('$')/2, 0)<CR>
vnoremap <silent> <M-.> :<C-u>call <SID>LR_move_cursor( virtcol('$')/2, 1)<CR>
nnoremap <silent> <D-l> :call      <SID>LR_move_cursor( virtcol('$')/2, 0)<CR>
inoremap <silent> <D-l> <C-o>:call <SID>LR_move_cursor( virtcol('$')/2, 0)<CR>
vnoremap <silent> <D-l> :<C-u>call <SID>LR_move_cursor( virtcol('$')/2, 1)<CR>
  " Move to Quarter-line position
nnoremap <silent> <D-,> :call      <SID>LR_move_cursor( virtcol('$')/4, 0)<CR>
inoremap <silent> <D-,> <C-o>:call <SID>LR_move_cursor( virtcol('$')/4, 0)<CR>
vnoremap <silent> <D-,> :<C-u>call <SID>LR_move_cursor( virtcol('$')/4, 1)<CR>
  " Move to Three-quarter-line position
nnoremap <silent> <D-/> :call      <SID>LR_move_cursor( virtcol('$')*3/4, 0)<CR>
inoremap <silent> <D-/> <C-o>:call <SID>LR_move_cursor( virtcol('$')*3/4, 0)<CR>
vnoremap <silent> <D-/> :<C-u>call <SID>LR_move_cursor( virtcol('$')*3/4, 1)<CR>

" Clear search buffer
:nnoremap <M-2> :nohlsearch<cr>
:inoremap <M-2> <C-o>:nohlsearch<cr>

" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %

" File System Explorer (in horizontal split)
map <leader>. :Sexplore<cr>

""" Switch to next/previous/alternate buffer, list buffers
:nnoremap <leader>bb :buffer#<CR>
:nnoremap [b :bprevious<CR>
:nnoremap ]b :bnext<CR>
:nnoremap [B :bfirst<CR>
:nnoremap ]B :blast<CR>
:nnoremap <leader>b<Space> :ls!<CR>
:nnoremap <leader>bn :ls!<CR>:buffer<Space>

" Buffers (runs the delete buffer command on all open buffers)
map <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
noremap <C-W>0 <C-W>=
noremap <C-W>= <C-W>+

" Handling horizontal Vim windows doesn't appear to be possible.
" Attempting to map <C-W> < and > didn't work
" Same with mapping <C-W>|

" Make splitting Vim windows easier
map <leader>; <C-W>s
map <leader>` <C-W>v

" Running Tests...
" See also <https://gist.github.com/8114940>

" Run currently open RSpec test file
map <Leader>rf :w<cr>:!rspec % --format nested<cr>

" Run current RSpec test
" RSpec is clever enough to work out the test to run if the cursor is on any line within the test
map <Leader>rl :w<cr>:exe "!rspec %" . ":" . line(".")<cr>

" Run all RSpec tests
map <Leader>rt :w<cr>:!rspec --format nested<cr>

" Run currently open cucumber feature file
map <Leader>cf :w<cr>:!cucumber %<cr>

" Run current cucumber scenario
map <Leader>cl :w<cr>:exe "!cucumber %" . ":" . line(".")<cr>

" Run all cucumber feature files
map <Leader>ct :w<cr>:!cucumber<cr>

" Tmux style window selection
map <Leader>ws :ChooseWin<cr>
" }}}

""" <!LR> POST-config  {{{

""" turn off viminfo logging
set viminfo=

""" }}}

" ---------------------------------------------------------------------------- "
" ~/.vim/after/plugin/override.vim  is the last resort settings file which is loaded after
" this file and all the plugins. Put stuff there for final override.
" See :help 'runtimepath'

" vim:fdm=marker:fdl=0:
