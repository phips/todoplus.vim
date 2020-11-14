" Only do this when not done yet for this buffer
function! TodoPlusDone()
  silent execute 's/\(^\s*\)[✘❑✔]*\(\s*\)/\1✔ /'
  silent execute ':normal! A'
  silent execute ':r! date         "+  -- DONE:     \%Y-\%m-\%d \%H:\%M"'
endfunction

function! TodoPlusTodo()
  silent execute 's/\(^\s*\)[✘❑✔]*\(\s*\)/\1❑ /'
  silent execute ':normal! A'
  silent execute ':r! date         "+  -- STARTED:  \%Y-\%m-\%d \%H:\%M"'
endfunction

function! TodoPlusCanceled()
  silent execute 's/\(^\s*\)[✘❑✔]*\(\s*\)/\1✘ /'
  silent execute ':normal! A'
  silent execute ':r! date         "+  -- CANCELED: \%Y-\%m-\%d \%H:\%M"'
endfunction

function! TodoPlusAddPomo()
  silent execute 's/^\(.*\)$/\1 🍅/'
  silent execute ':normal! A'
  silent execute ':r! date -v -25M "+  -- POMODORO: \%Y-\%m-\%d \%H:\%M"'
  silent execute ':r! date         "+ -> \%H:\%M"'
  execute "normal" "kJ"
endfunction

xnoremap <Leader>tpd :call TodoPlusTodo()<CR>
xnoremap <Leader>tpt :call TodoPlusDone()<CR>
xnoremap <Leader>tpc :call TodoPlusCanceled()<CR>

command! TodoPlusDone call TodoPlusDone()
command! TodoPlusTodo call TodoPlusTodo()
command! TodoPlusCanceled call TodoPlusCanceled()
command! TodoPlusAddPomo call TodoPlusAddPomo()
