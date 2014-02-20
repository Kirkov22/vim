" tabdoctor.vim - Tab Doctor
" Redo indents of blocks of code or whole files
" Author:       Tim Schofield
" Version:      1.0
" License:      Same as Vim itself.  See :help license

if exists("g:loaded_tabdoctor") || &cp
  finish
endif
let g:loaded_tabdoctor = 1

augroup tabdoctor
  autocmd!
  autocmd FileType java
        \ let b:seperator = '\s' |
        \ let b:comment = '//' |
        \ let b:literal = "' \"" |
        \ let b:start_block = '{' |
        \ let b:cont_to = '= + - / \* && || ,' |
        \ let b:cont_from = '= + - /\= \* && ||' |
        \ let b:doc_region = '' |
        \ let b:end_block = '}'
  autocmd FileType ruby
        \ let b:seperator = '\s' |
        \ let b:comment = '#' |
        \ let b:literal = "' \"" |
        \ let b:start_block = '^\s*def ^\s*module ^\s*class ^\s*if ^\s*unless ^\s*begin ^\s*case \sdo {\(.*}\)\@! else\s\= when\s\= rescue\s\=' |
        \ let b:cont_to = '\\' |
        \ let b:cont_from = '' |
        \ let b:doc_region = '<<' |
        \ let b:end_block = 'end \({.*\)\@<!} else\s\= when\s\= rescue\s\='
  autocmd FileType scss
        \ let b:seperator = '\s' |
        \ let b:comment = '// /\*' |
        \ let b:literal = "' \"" |
        \ let b:start_block = '{' |
        \ let b:cont_to = ': ,' |
        \ let b:cont_from = '' |
        \ let b:doc_region = '' |
        \ let b:end_block = '}'
augroup END

nnoremap <leader><tab> :call <SID>retab_block()<cr>
nnoremap <leader><s-tab> :call <SID>retab_file()<cr>

function! s:retab_block()
  " Generate indent character
  " If user has expandtab set, use spaces instead of tab character
  if (&expandtab)
    let l:tab_char = repeat(" ", &tabstop)
  else
    let l:tab_char = "\t"
  endif

  " Set up search patterns
  let l:comments = '\('.substitute(b:comment, b:seperator, '\\|', 'g').'\).*$'
  let l:literals = split(b:literal, b:seperator, 1)
  let l:start_pat = substitute(b:start_block, b:seperator, '\\|', 'g')
  let l:cont_to_pat = '\('.substitute(b:cont_to, b:seperator, '\\|', 'g').'\)$'
  let l:cont_from_pat = '^\s*\('.substitute(b:cont_from, b:seperator, '\\|', 'g').'\)'
  let l:doc_region_start = '.*\('.b:doc_region.'\)\(\S\+\)$'
  let l:end_pat = substitute(b:end_block, b:seperator, '\\|', 'g')

  let l:doc_started = 0
  let l:doc_end = ''

  " Move cursor to end of line and search for first previous start block
  execute "normal! $"
  if (search(l:start_pat, 'bcW') > 0)
    let l:line_no = line('.')
    let l:block_count = 1
    let l:block_indent = matchstr(getline('.'), '\s*')
    let l:indent_next = 0
 
    " While you're still within a block and haven't reached the last line ...
    while (l:block_count > 0) && s:not_last_line(l:line_no)
      let l:line_no += 1
      let l:updates = s:retab(l:tab_char, l:block_indent,
        \ l:line_no, l:block_count, l:indent_next, 
        \ l:comments, l:literals, l:start_pat, l:end_pat,
        \ l:cont_to_pat, l:cont_from_pat,
        \ l:doc_region_start, l:doc_started, l:doc_end)
      let l:block_count = updates[0]
      let l:indent_next = updates[1]
      let l:doc_started = updates[2]
      let l:doc_end     = updates[3]
    endwhile
  endif
endfunction

function! s:retab_file()
  " Generate indent character
  " If user has expandtab set, use spaces instead of tab character
  if (&expandtab)
    let l:tab_char = repeat(" ", &tabstop)
  else
    let l:tab_char = "\t"
  endif

  " Set up search patterns
  let l:comments = '\('.substitute(b:comment, b:seperator, '\\|', 'g').'\).*$'
  let l:literals = split(b:literal, b:seperator, 1)
  let l:start_pat = substitute(b:start_block, b:seperator, '\\|', 'g')
  let l:cont_to_pat = '\('.substitute(b:cont_to, b:seperator, '\\|', 'g').'\)$'
  let l:cont_from_pat = '^\s*\('.substitute(b:cont_from, b:seperator, '\\|', 'g').'\)'
  let l:doc_region_start = '.*\('.b:doc_region.'\)\(\S\+\)$'
  let l:end_pat = substitute(b:end_block, b:seperator, '\\|', 'g')

  let l:line_no = -1 
  let l:block_count = 0
  let l:indent_next = 0
  let l:doc_started = 0
  let l:doc_end = ''

  " While you're still within a block and haven't reached the last line ...
  while s:not_last_line(l:line_no)
    let l:line_no += 1
    let l:updates = s:retab(l:tab_char, '',
      \ l:line_no, l:block_count, l:indent_next, 
      \ l:comments, l:literals, l:start_pat, l:end_pat,
      \ l:cont_to_pat, l:cont_from_pat,
      \ l:doc_region_start, l:doc_started, l:doc_end)
    let l:block_count = updates[0]
    let l:indent_next = updates[1]
    let l:doc_started = updates[2]
    let l:doc_end     = updates[3]
  endwhile
endfunction

" This function calculates the line by line indent and
" returns [block count, indent_next] after processing the line
function! s:retab(tab_char, block_indent,
  \ line_no, block_count, indent_next,
  \ comments, literals, start_pat, end_pat,
  \ cont_to_pat, cont_from_pat,
  \ doc_start, doc_started, doc_end)
  
  " Assign arguments that need to be modified to local variables
  let l:block_count = a:block_count
  let l:indent_next = a:indent_next
  let l:doc_started = a:doc_started
  let l:doc_end = a:doc_end

  " Read line
  let l:line = getline(a:line_no)

  if (!l:doc_started)
    " Remove comments and literals
    for l:literal in a:literals
      let l:line = substitute(l:line, l:literal.'.\{-}'.l:literal, '', 'g')
    endfor

    let l:line = substitute(l:line, a:comments, '', '')

    " Lower indent count by number of end blocks on this line
    let l:block_count -= s:count_matches(l:line, a:end_pat)
    
    " If not previously indicated ...
    if !l:indent_next && b:cont_from !=# ''
      " ... check if this line is continued from previous
      let l:indent_next = l:line =~? a:cont_from_pat
    endif

    " Redo spacing of the current line
    execute a:line_no.'s/\m^\s*/'.a:block_indent.
      \ repeat(a:tab_char, (l:block_count + l:indent_next)).'/' 
    
    "Disable 'indent_next'
    if l:indent_next
      let l:indent_next = 0
    endif

    " Check if next line should be indented
    if b:cont_to !=# ''
      let l:indent_next = l:line =~? a:cont_to_pat
    endif

    " Check if a document is starting on the next line
    let l:doc_end = substitute(l:line, a:doc_start, '\2', '')
    let l:doc_started = l:line != l:doc_end
    " Increase indent count by number of start blocks on this line
    let l:block_count += s:count_matches(l:line, a:start_pat)
  else
    let l:doc_started = !(l:line =~# '^'.a:doc_end)
  endif

  return [l:block_count, l:indent_next, l:doc_started, l:doc_end]
endfunction

function! s:count_matches(line, expr)
  return (len(split(a:line, a:expr, 1)) - 1)
endfunction

function! s:not_last_line(line_no)
  return (a:line_no < line('$'))
endfunction
