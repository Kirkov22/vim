" refactory.vim - Refactory
" Replace all instances of the word under the cursor with another word
" Author:       Tim Schofield
" Version:      1.0
" License:      Same as Vim itself.  See :help license

nnoremap <script> <silent> <leader>r :call <SID>refactor()<CR>

" Replace all instances of current word with a user provided new word
function! s:refactor()
  let b:saved_contents = @@

  execute "normal! viwy"
  let b:old_word = @@
  let b:char = ""
  let b:new_word = input("Refactoring (".b:old_word."), enter new name: ")
  execute "%s/\\<".b:old_word."\\>/".b:new_word."/g"

  let @@ = b:saved_contents
endfunction
