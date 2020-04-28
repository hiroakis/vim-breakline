" Version: 0.0.1
" Author: hiroakis <hiroaki.sano.9stories@gmail.com>
" License: MIT

let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

if exists('g:loaded_breakline')
    finish
endif

let g:loaded_breakline = 1

command! -range -nargs=+ Break call breakline#run_break(<f-args>)
command! -range -nargs=1 BreakSpace call breakline#run_break_space(<f-args>)

vnoremap <silent> <Plug>(VBreak) :<C-u>Break<CR>
vnoremap <silent> <Plug>(VBreakSpace) :<C-u>BreakSpace<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
