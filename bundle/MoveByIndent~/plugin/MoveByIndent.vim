" Title:   MoveByIndent
" Author:  Leo Razoumov
" Version: 0.1

if  exists("g:loaded_MoveByIndent")
    finish
endif
let g:loaded_MoveByIndent = 1

" Jump to the next/previous line that has the same/less/more levels of indentation
" than the current line.
"
" fwd (bool): true: Go to next line; false: Go to previous line
" change_lvl (int): 0 - keep same level; -1 - less indent; +1 - more indent
" skipblanks (bool): true: Skip blank lines; false: Don't skip blank lines
"
function! MoveByIndent_move(fwd, change_lvl, skipblanks)

    let l:orig_ln = line('.')
    let l:ln = l:orig_ln
    let l:column= col('.')
    let l:lastline = line('$')
    let l:orig_indent= indent(l:orig_ln)
    let l:step = a:fwd ? 1 : -1
    let l:tgt_ln= l:ln
    let l:state= 0 " 0 init; 1 same indent; 2 blank; 3 less indent; 4 more indent

    while l:ln > 0 && l:ln <= l:lastline
        let l:ln += l:step
        let l:indt= indent(l:ln)
        if  a:skipblanks && getline(l:ln) =~ '^\s*$'
            let l:state= 2 " blank line
            continue
        elseif (l:orig_indent==0 && l:indt==0 && l:state > 1)
            let l:tgt_ln= l:ln
            break
        elseif  l:indt == l:orig_indent
            if  l:state > 1 && a:change_lvl == 0
                let l:tgt_ln = l:ln
                break
            endif
            let l:state = 1 " same indent
        elseif  l:indt  < l:orig_indent
            let l:state = 3 " less indent
            if  a:change_lvl < 0
                let l:tgt_ln = l:ln
            endif
            break
        elseif  l:indt  > l:orig_indent
            let l:state = 4 " more indent
            if  a:change_lvl > 0
                let l:tgt_ln = l:ln
                break
            endif
        endif
        let l:tgt_ln = l:ln
    endwhile

    if  l:tgt_ln != l:orig_ln
        exe l:tgt_ln
        exe "normal " column . "|"
    endif

endfunction

" Moving back and forth between lines of same, less or more indentation.

nnoremap <silent> <C-S-Up>    :call MoveByIndent_move(0,  0, 1)<CR>
nnoremap <silent> <C-S-Down>  :call MoveByIndent_move(1,  0, 1)<CR>
nnoremap <silent> <C-S-Left>  :call MoveByIndent_move(0, -1, 1)<CR>
nnoremap <silent> <C-S-Right> :call MoveByIndent_move(1,  1, 1)<CR>
nnoremap <silent> <C-A-Up>    :call MoveByIndent_move(0,  1, 1)<CR>
nnoremap <silent> <C-A-Down>  :call MoveByIndent_move(1, -1, 1)<CR>

vnoremap <silent> <C-S-Up>    <Esc>:call MoveByIndent_move(0,  0, 1)<CR>m'gv''
vnoremap <silent> <C-S-Down>  <Esc>:call MoveByIndent_move(1,  0, 1)<CR>m'gv''
vnoremap <silent> <C-S-Left>  <Esc>:call MoveByIndent_move(0, -1, 1)<CR>m'gv''
vnoremap <silent> <C-S-Right> <Esc>:call MoveByIndent_move(1,  1, 1)<CR>m'gv''
vnoremap <silent> <C-A-Up>    <Esc>:call MoveByIndent_move(0,  1, 1)<CR>m'gv''
vnoremap <silent> <C-A-Down>  <Esc>:call MoveByIndent_move(1, -1, 1)<CR>m'gv''

onoremap <silent> <C-S-Up>    :call MoveByIndent_move(0,  0, 1)<CR>
onoremap <silent> <C-S-Down>  :call MoveByIndent_move(1,  0, 1)<CR>
onoremap <silent> <C-S-Left>  :call MoveByIndent_move(0, -1, 1)<CR>
onoremap <silent> <C-S-Right> :call MoveByIndent_move(1,  1, 1)<CR>
onoremap <silent> <C-A-Up>    :call MoveByIndent_move(0,  1, 1)<CR>
onoremap <silent> <C-A-Down>  :call MoveByIndent_move(1, -1, 1)<CR>


" #####################################
" vim:fdm=marker:fdl=0:ts=4:sts=4:sw=4:
