" Vim color file
" Maintainer:	Leo Razoumov <slonik.az@gmail.com>
" Last Change:	2016-10-22

" This color scheme uses a light background.

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "lr-light"

hi Normal cterm=bold ctermfg=Black ctermbg=White gui=bold guifg=Black guibg=#fffff8

" Groups used in the 'highlight' and 'guicursor' options default value.
hi Comment gui=bold guifg=#008000
hi Identifier gui=bold guifg=#0000ff  " DarkCyan
hi PreProc gui=bold guifg=#ff00ff
hi Type gui=bold guifg=#8800ff
hi ErrorMsg term=standout ctermbg=Red ctermfg=Black gui=bold guibg=#ff88ff guifg=#000000
hi Error    term=standout ctermbg=Red ctermfg=Black gui=bold guibg=#ff88ff guifg=#000000
hi ModeMsg term=bold cterm=bold gui=bold
" hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
" hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=NONE ctermfg=White ctermbg=Black gui=bold guifg=Red guibg=#00ff00
hi VisualNOS term=NONE ctermfg=White ctermbg=Black gui=bold guifg=White guibg=Black
" hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Yellow gui=bold guibg=Yellow
" hi Cursor  gui=bold guibg=#cc00ff guifg=#00ff00
hi Cursor gui=bold guifg=#ffff80 guibg=#0000f0
hi lCursor gui=bold guibg=#00ffff guifg=#ff0000
hi CursorLine term=underline cterm=underline gui=bold guibg=grey80
hi CursorLineNr gui=bold guifg=#000088 guibg=#f08000
hi CursorColumn term=reverse ctermbg=grey gui=bold guibg=grey50
hi Directory term=bold ctermfg=DarkBlue gui=bold guifg=Blue
hi LineNr term=underline gui=bold guibg=Grey95 guifg=Black
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue guibg=grey80
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=bold ctermbg=Red ctermfg=Black gui=bold guibg=#ff0000 guifg=#000000
hi IncSearch term=bold ctermbg=Red ctermfg=Black gui=bold guibg=#ff0000 guifg=#000000
hi SpecialKey term=bold ctermfg=DarkBlue gui=bold guifg=Blue
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=#000000 guibg=#44ff44
hi WarningMsg term=standout ctermfg=DarkRed gui=bold guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black gui=bold guibg=Yellow guifg=Black
" hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi Folded cterm=standout ctermbg=Grey ctermfg=DarkBlue guibg=#ddff00 guifg=#0000ff
" hi Folded  gui=bold guifg=White guibg=Brown
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue gui=bold guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue gui=bold guibg=LightGreen
hi DiffChange term=bold ctermbg=LightMagenta gui=bold guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightBlue

" Colors for syntax highlighting
hi Constant term=underline ctermfg=DarkRed gui=bold guifg=Brown
hi Special term=bold ctermfg=DarkMagenta gui=bold guifg=#bb00bb
if &t_Co > 8 || 1
  hi Statement term=bold cterm=bold ctermfg=Brown gui=bold guifg=#a02020
endif
hi Ignore ctermfg=Grey guifg=grey50

hi ToDo gui=bold guifg=#00ffff guibg=#ff0000

""" Syntax highlight for open fold headers
" hi hiLR  gui=bold  guifg=black  guibg=LightRed
" hi hiLR   gui=bold guifg=Yellow guibg=DarkBlue
hi hiLR  gui=bold guibg=#ffaaff guifg=#0000bb
hi hiLR3 gui=bold guibg=#ffff00 guifg=#e00000
hi hiLR4 gui=bold guifg=#ff0000 guibg=#00ffff

" #########
" vim: sw=2
