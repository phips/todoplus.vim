" Vim syntax file
" Language: todoplus
" Maintainer: Andrea Schiavini <metalelf0@gmail.com>
" Version:  1.1
" Last Change:  2020 Nov 8

" Quit when a syntax file is already loaded.
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'todoplus'
endif

syn keyword celTodo contained TODO FIXME XXX NOTE WTF ???
syn match celComment "[^\\]///.*$" contains=celTodo
syn match todoPlusTag /@\((.\{-,100\})\|\w\+\)/
syn match titleTodo /^\s*=+.*$/
syn region newTodo start=/^\s*\(\[\s\+\]\|❑\).*$/ end=/$/ contains=celComment,celTodo,todoPlusTag
syn region inProgressTodo start=/^\s*\[\.\+\].*$/ end=/$/  contains=celComment,celTodo,todoPlusTag
syn region completedTodo  start=/^\s*\(\[[xX]\+\]\|✔\).*$/ end=/$/ contains=celComment,celTodo,todoPlusTag
syn region canceledTodo  start=/^\s*\(\[[-]\]\|✘\).*$/ end=/$/ contains=celComment,celTodo,todoPlusTag
syn region todoPlusHeader start=/^.*:$/ end=/$/ contains=celTodo,todoPlusTag

hi! link newTodo                    String
hi! link titleTodo                  Statement
hi! link completedTodo              Comment
hi! link canceledTodo               Identifier
hi! link inProgressTodo             Special
hi! link todoPlusHeader             markdownH1
hi! link todoPlusTag                Statement
hi! link celTodo Todo
hi! link celComment Comment

let b:current_syntax = "todoplus"
