" tabdoctor.vim - Tab Doctor
" Redo indents of blocks of code or whole files
" Author:       Tim Schofield
" Version:      1.0
" License:      Same as Vim itself.  See :help license

augroup tabdoctor
  autocmd!
  autocmd FileType java
        \ let b:start_block = "{" |
        \ let b:assignment = "=" |
        \ let b:end_line = ";" |
        \ let b:end_block = "}"
augroup END

nnoremap <leader><tab> :call <SID>retab()<cr>

function! s:retab()
  " Generate indent character
  " If user has expandtab set, use spaces instead of tab character
  if (&expandtab)
    let l:tab_char = repeat(" ", &tabstop)
  else
    let l:tab_char = "\t"
  endif

  " Move cursor to end of line and search for first previous start block
  execute "normal! $"
  if (search(b:start_block, 'bcW') > 0)
    let l:line_no = line('.')
    let l:block_count = 1
    let l:block_indent = matchstr(getline('.'), '\s*')
 
    " While you're still within a block and haven't reached the last line ...
    while (l:block_count > 0) && s:not_last_line(l:line_no)
      let l:line_no += 1
      " Lower indent count by number of end blocks on this line
      let l:block_count -= s:count_matches(l:line_no, b:end_block)
      " Redo spacing of the current line
      execute l:line_no.'s/\m^\s*/'.l:block_indent.repeat(l:tab_char, l:block_count).'/' 
      " Increase indent count by number of start blocks on this line
      let l:block_count += s:count_matches(l:line_no, b:start_block)
    endwhile
  endif
endfunction

function! s:count_matches(line_no, expr)
  return (len(split(getline(a:line_no), a:expr, 1)) - 1)
endfunction

function! s:not_last_line(line_no)
  return (a:line_no <= line('$'))
endfunction
