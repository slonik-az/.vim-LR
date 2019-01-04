" Vim color file
" Maintainer:	Leo Razoumov <slonik.az@gmail.com>
" Last Change:	2016-10-22

" This color scheme uses a dark background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "lr-dark"

hi Normal cterm=bold ctermfg=White ctermbg=Black gui=bold guifg=#ffffff guibg=Black

" Groups used in the 'highlight' and 'guicursor' options default value.
hi String cterm=bold ctermfg=10 gui=bold guifg=#00ff00
hi Comment cterm=bold ctermfg=14 gui=bold guifg=#00ffff
hi Identifier gui=bold guifg=#ffd700 ctermfg=220
hi PreProc gui=bold guifg=#ff00ff cterm=bold ctermfg=201
hi Type gui=bold guifg=#8800ff
hi ErrorMsg term=standout ctermbg=Red ctermfg=Black gui=bold guibg=#ff88ff guifg=#000000
hi Error    term=standout ctermbg=Red ctermfg=Black gui=bold guibg=#ff88ff guifg=#000000
hi ModeMsg term=bold cterm=bold gui=bold
" hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
" hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=NONE ctermfg=White ctermbg=Black gui=bold guibg=#ff0000 guifg=#00ffff
hi VisualNOS term=NONE ctermfg=White ctermbg=Black gui=bold guifg=White guibg=Black
" hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Yellow gui=bold guibg=Yellow
hi Cursor  gui=bold guibg=#ff00ff guifg=#00ff00 cterm=bold ctermbg=10 ctermfg=16
" " hi Cursor gui=bold guifg=#ffff80 guibg=#0000f0
" hi lCursor gui=bold guibg=#00ffff guifg=#ff0000
hi CursorLine cterm=bold ctermbg=239 gui=bold guibg=grey80
" hi CursorLine term=underline cterm=underline ctermbg=239 gui=bold guibg=grey80
hi CursorLineNr gui=bold guifg=#000088 guibg=#f08000 cterm=bold ctermfg=16 ctermbg=202
hi CursorColumn cterm=bold ctermbg=239 gui=bold guibg=grey30
" hi CursorColumn cterm=reverse ctermbg=grey gui=bold guibg=grey50
hi Directory term=bold ctermfg=DarkBlue gui=bold guifg=Blue
hi LineNr term=underline gui=bold guibg=#004400 guifg=White
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue guibg=grey80
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=bold ctermbg=Red ctermfg=Black gui=bold guibg=#ff0000 guifg=#000000
hi IncSearch term=bold ctermbg=Red ctermfg=Black gui=bold guibg=#ff0000 guifg=#000000
hi SpecialKey term=bold ctermfg=DarkBlue gui=bold guifg=Blue
hi Title cterm=bold ctermfg=16 ctermbg=51 gui=bold guifg=#000000 guibg=#00ffff
hi WarningMsg term=standout ctermfg=DarkRed gui=bold guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black gui=bold guibg=Yellow guifg=Black
" hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi Folded cterm=bold ctermbg=12 ctermfg=15 gui=bold guibg=#0000ff guifg=#ffffff
" hi Folded  gui=bold guifg=White guibg=Brown
hi FoldColumn cterm=bold ctermbg=12 ctermfg=15 gui=bold guibg=#0000ff guifg=#ffffff
" hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue gui=bold guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue gui=bold guibg=LightGreen
hi DiffChange term=bold ctermbg=LightMagenta gui=bold guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightBlue

" Colors for syntax highlighting
hi Constant cterm=bold ctermfg=219 gui=bold guifg=#ffafff
hi Special  cterm=bold ctermfg=DarkMagenta gui=bold guifg=#bb00bb
if &t_Co > 8 || 1
  hi Statement term=bold cterm=bold ctermfg=202 gui=bold guifg=#ff5f00
  "hi Statement term=bold cterm=bold ctermfg=Brown gui=bold guifg=#a02020
endif
hi Ignore ctermfg=Grey guifg=grey50

hi ToDo gui=bold guifg=#00ffff guibg=#ff0000

""" Syntax highlight for open fold headers
" hi hiLR  gui=bold  guifg=black  guibg=LightRed
" hi hiLR   gui=bold guifg=Yellow guibg=DarkBlue
hi hiLR  gui=bold guibg=#ffff00 guifg=#000000 cterm=bold ctermfg=16 ctermbg=226
hi hiLR3 gui=bold guibg=#ffff00 guifg=#e00000 cterm=bold ctermfg=9  ctermbg=226
hi hiLR4 gui=bold guifg=#ff0000 guibg=#00ffff

" #########
" vim: sw=2
