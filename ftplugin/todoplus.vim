" Only do this when not done yet for this buffer
function! TodoPlusDone()
  silent execute 's/^\(\s*\)[❑✘]/\1✔/'
endfunction

function! TodoPlusTodo()
  silent execute 's/^\(\s*\)[✘✔]/\1❑/'
endfunction

function! TodoPlusCanceled()
  silent execute 's/^\(\s*\)[❑✔]/\1✘/'
endfunction

xnoremap <Leader>tpd :call TodoPlusTodo()<CR>
xnoremap <Leader>tpt :call TodoPlusDone()<CR>
xnoremap <Leader>tpc :call TodoPlusCanceled()<CR>
