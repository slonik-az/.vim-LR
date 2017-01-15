" Title:   lr-colors
" Author:  Leo Razoumov
" Version: 0.1

if  exists("g:loaded_lr_colors")
    finish
endif
let g:loaded_lr_colors = 1

" LineNr, CursorLine settings   {{{

""" Highlight the line where cursor is (aka current line)
set cursorline
" set cursorcolumn

" s:fix_CursorLine is called by autocmd.
function! s:fix_CursorLine(diff)
    if  a:diff
        hi CursorLine  gui=bold guibg=NONE
        set foldcolumn=0 " if non-zero eats precious horizontal space in vimdiff vertical split.
    else
        hi CursorLine  gui=bold guibg=Grey80
    endif
endfunction

""" Mode specific LineNr settings. [Changes Globally. Disappointing!]
let g:LineNr_Insert_bg=    '#550055'
let g:LineNr_NonInsert_bg= '#004400'
" }}}

" LR syntax highlights      {{{

function! LR_Syntax_hi(ft)
    syntax match Title "\m^\(##\|//\|/\*\|--\)*[ *#%|=~+-]*|>.*$" containedin=ALL
    syntax match hiLR4 "\m!\(IMPORTANT\|TODO\|NOTE\)!" containedin=ALL
    " if (a:ft == "text" || a:ft == "R" || a:ft == "python")
    if  index(['text','tex','python','R','sh'], a:ft) >= 0
        syntax match hiLR "\m^\(\*\*\*\|###\|%%%\|===\|---\|+++\)[ \t].*$" containedin=ALL
      if  a:ft == "text"
          syntax match hiLR3 /\m^\s*\zs\(([0-9*#=o+-]\+)\|[*#=o+-]\)\ze\s/ containedin=ALL
      else
          syntax match hiLR3 /\m\(^\|\s\)\zs([0-9*#=o+-]\+)\ze\s/ containedin=ALL
      endif
    endif
    if (a:ft == "tex" || a:ft == "lyx")
        syntax match hiLR /\m^.*<<:.*$/
        syntax match hiLR3 /\m\(<<:\|>>:\)\d*/ containedin=ALL
        syntax match hiLR3 /\m^\s*\zs\(([0-9*#=o+-]\+)\|[*#=o+-]\)\ze\s/ containedin=ALL
        syntax spell toplevel " highlight misspelings
    else
        syntax match hiLR /\m^.*\({{{\|}}}\).*$/
        syntax match hiLR3 /\m\({{{\|}}}\)\d*/ containedin=ALL
        if (a:ft == "help")
            syntax spell toplevel " highlight misspelings
        endif
    endif
endfunction

" }}}

" autocmd augroup       {{{

augroup aug_lr_colors
  autocmd!
  autocmd InsertEnter * :exe 'hi LineNr guifg=White guibg=' . g:LineNr_Insert_bg
  autocmd InsertLeave * :exe 'hi LineNr guifg=White guibg=' . g:LineNr_NonInsert_bg
  autocmd FilterWritePre * :call s:fix_CursorLine(&diff)
  autocmd Syntax * if line('$')<12345 | call LR_Syntax_hi(&ft) |endif
augroup END

" }}}

" ##########################
" vim:fdm=marker:fdl=0:sw=4:
