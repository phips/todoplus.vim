" Only do this when not done yet for this buffer
function! TodoPlusDone()
  silent execute 's/\(^\s*\)[✘❑✔]*\(\s*\)/\1✔ /'
endfunction

function! TodoPlusTodo()
  silent execute 's/\(^\s*\)[✘❑✔]*\(\s*\)/\1❑ /'
endfunction

function! TodoPlusCanceled()
  silent execute 's/\(^\s*\)[✘❑✔]*\(\s*\)/\1✘ /'
endfunction

function! TodoPlusAddPomo()
  silent execute 's/^\(.*\)$/\1 🍅/'
  silent execute ':normal! A'
  silent execute ':r! date -v -25M "+ -- POMODORO: \%Y-\%m-\%d \%H:\%M"'
  silent execute ':r! date         "+ -> \%H:\%M"'
  execute "normal" "kJ"
endfunction

xnoremap <Leader>tpd :call TodoPlusTodo()<CR>
xnoremap <Leader>tpt :call TodoPlusDone()<CR>
xnoremap <Leader>tpc :call TodoPlusCanceled()<CR>
