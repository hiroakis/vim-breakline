" Version: 0.0.1
" Author: hiroakis <hiroaki.sano.9stories@gmail.com>
" License: MIT

let s:save_cpo = &cpo
set cpo&vim

function! breakline#run_break_space(count) abort
    call breakline#run_break(' ', a:count)
endfunction

function! breakline#run_break(separator, count) abort
    let l:org_line_pos = line('.')
    let l:org_col_pos = col('.')

    let l:text = s:get_text()

    let l:lp = 0
    let l:cnt = 0
    for v in l:text
        let l:ln = split(v, a:separator)

        let l:lpos = l:org_line_pos+l:lp
        let l:buf = ""
        let l:index = 0
        while l:index < len(l:ln)
            if l:index == len(l:ln)-1
                let l:buf = l:buf . l:ln[l:index]
            else
                let l:buf = l:buf . l:ln[l:index] . a:separator
            endif
            if (l:index+1) % a:count == 0
                call setline(l:lpos+l:cnt, l:buf)
                call cursor(l:lpos+l:cnt, l:org_col_pos)
                if l:index != len(l:ln)-1
                    let l:cnt += 1
                    call append(expand('.'), '')
                endif

                let l:buf = ""
            endif
            let l:index = l:index + 1
        endwhile
        if l:buf != ""
            call setline(l:lpos+l:cnt, l:buf)
        endif

        let l:lp += 1
    endfor
endfunction

function! s:write() abort
endfunction

function! s:get_text() abort
  let l:reg = '"'

  silent execute 'normal! gv"'.l:reg."y"
  let l:text = getreg(l:reg, 1, 1)
  return l:text
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:

