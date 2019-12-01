let g:clap_session_dir = get(g:, 'clap_session_dir', '~/.vimsessions')

function! s:getSessionPath(name)
  if strlen(a:name)
    return g:clap_session_dir..'/'..a:name
  endif

  if strlen(v:this_session)
    return v:this_session
  endif

  let name = input('Session name: ')
  return g:clap_session_dir..'/'..name
endfunction

function! clap#sessions#saveOrCreateSession(name)
  let session = s:getSessionPath(a:name)
  exe 'mksession! '..session
  redraw!
  echo 'Saved session to: '..session
endfunction

