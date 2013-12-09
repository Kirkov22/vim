" vim syntax file
" Language:     Sass
" Maintainer:   Tim Schofield
" Last Change:  2013 Dec 08

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

set iskeyword+=@-@,-
" Keywords
syn keyword sassImport @import
syn keyword sassInclude @inlcude
syn keyword sassMixin @mixin

" Matches
syn match sassOperator '&'
syn match sassOperator ':'
syn match sassOperator '\s+\s'
syn match sassOperator '\s-\s'
syn match sassOperator '\s*\s'
syn match sassOperator '\s/\s'

syn match sassInclude '^\s*+[-_a-zA-Z]\+'
syn match sassMixin '^\s*=[-_a-zA-Z]\+'

syn match sassVariable '$[-_a-zA-Z]\+'

" Regions
syn region sassString start=/"/ skip=/\./ end=/"/
syn region sassComment start="^\z(\s*\)//" end="^\%(\z1\s\)\@!"
syn region sassCssComment start="^\z(\s*\)/\*" end="^\%(\z1\s\)\@!"

" Highlight Instructions
let b:current_syntax = "sass"

hi def link sassInclude     PreProc
hi def link sassImport      PreProc
hi def link sassMixin       PreProc

hi def link sassVariable    Variable
hi def link sassOperator    Operator

hi def link sassString      String
hi def link sassComment     Comment
hi def link sassCssComment  Comment
