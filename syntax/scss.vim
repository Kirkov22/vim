" vim syntax file
" Language:     Scss
" Maintainer:   Tim Schofield
" Last Change:  2013 Dec 08

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

set iskeyword+=@-@,-
" Keywords
syn keyword scssImport @import
syn keyword scssInclude @include
syn keyword scssMixin @mixin

" Matches
syn match scssOperator '&'
syn match scssOperator ':'
syn match scssOperator '\s+\s'
syn match scssOperator '\s-\s'
syn match scssOperator '\s*\s'
syn match scssOperator '\s/\s'

syn match scssVariable '$[-_a-zA-Z]\+'

" Regions
syn region scssString start=/"/ skip=/\./ end=/"/
syn region scssComment start="//" end="\n"
syn region scssCssComment start="/\*" end="\*/"

" Highlight Instructions
let b:current_syntax = "scss"

hi def link scssInclude     PreProc
hi def link scssImport      PreProc
hi def link scssMixin       PreProc

hi def link scssVariable    Variable
hi def link scssOperator    Operator

hi def link scssString      String
hi def link scssComment     Comment
hi def link scssCssComment  Comment
