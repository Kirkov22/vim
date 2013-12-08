" vim syntax file
" Language:     Sass
" Maintainer:   Tim Schofield
" Last Change:  2013 Dec 08

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword sassConstant normal, bold, italic

" Matches
syn match sassOperator '&'
syn match sassOperator '+'
syn match sassOperator '-'
syn match sassOperator '*'
syn match sassOperator '/'

syn match sassImport '@import'
syn match sassInclude '@inlcude'
syn match sassInclude '^\s*+[-_a-zA-Z]\+'
syn match sassMixin '@mixin'
syn match sassMixin '^\s*=[-_a-zA-Z]\+'

syn match sassVariable '$[-_a-zA-Z]\+'

syn match sassConstant '[0-9]\+px'
syn match sassConstant '[.0-9]\+em'
syn match sassConstant '[.0-9]\+rem'
syn match sassConstant '#\x\{3}'
syn match sassConstant '#\x\{6}'

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
hi def link sassConstant    Constant

hi def link sassString      String
hi def link sassComment     Comment
hi def link sassCssComment  Comment
