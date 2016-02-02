if exists("b:current_syntax")
  finish
endif

syntax match splunkOption /\v\w+::\w+/
syntax match splunkHeader /\v\[\S+\]/ contains=splunkOption
syntax match splunkAttribute /\v^(\w|\s)+\=@=/
syntax match splunkInteger /\v\=@<=(\s|\d)+$/
syntax match splunkOperator /\v\=/

syntax region splunkComment start=/#/ end=/$/

hi link splunkOption PreProc
hi link splunkHeader Structure
hi link splunkAttribute Statement
hi link splunkInteger Constant
hi link splunkOperator Operator
hi link splunkComment Comment

let b:current_syntax = "splunk_conf"
