if exists("b:current_syntax")
  finish
endif

function! s:comment_cterm()
  redir => l:highlight
  exe "silent! hi Comment"
  redir END
  return matchstr(l:highlight, '\vctermfg\=\zs\d+\ze')
endfunction

function! s:comment_gui()
  redir => l:highlight
  exe "silent! hi Comment"
  redir END
  return matchstr(l:highlight, '\vguifg\=\zs\S+\ze')
endfunction

syntax match splunkOption /\v\w+::\w+/ contained
syntax match splunkHeader /\v\[\S+\]/ contains=splunkOption
syntax match splunkAttribute /\v^(\w|\s)+\=@=/
syntax match splunkInteger /\v\=@<=(\s|\d)+$/
syntax match splunkOperator /\v\=/

syntax region splunkComment start=/#/ end=/$/ oneline
syntax region splunkNotes start=/\v^\s*\*/ end=/^$/

hi link splunkOption PreProc
hi link splunkHeader Structure
hi link splunkAttribute Statement
hi link splunkInteger Constant
hi link splunkOperator Operator
hi link splunkComment Comment
let s:commentCterm = s:comment_cterm()
let s:commentGui = s:comment_gui()
exe "hi splunkNotes cterm=italic gui=italic ctermfg=" . 
  \ s:commentCterm . " guifg=" . s:commentGui

let b:current_syntax = "splunk_conf"
