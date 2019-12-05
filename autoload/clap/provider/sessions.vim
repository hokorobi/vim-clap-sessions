" Author: hokorobi <hokorobi.hokorobi@gmail.com>
" Description: List session files

let g:clap_session_dir = get(g:, 'clap_session_dir', '~/.vimsessions')

function! s:source() abort
  let filelist = glob(g:clap_session_dir..'/*')
  return split(filelist)
endfunc

function! s:sink(str) abort
  execute 'source '..a:str
endfunction

let s:sessions = {}
let s:sessions.sink = function('s:sink')
let s:sessions.source = function('s:source')

let g:clap#provider#sessions# = s:sessions

