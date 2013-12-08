" vim color scheme
"
" Name: compassion.vim
" Maintainer: Tim Schofield
 
set background=dark
hi clear
if exists("syntax on")
  syntax reset
endif

let g:colors_name = "compassion"

" Color Definitions
let s:powder_black = "#1A1A1A"
let s:dark_gray = "#282828"
let s:mid_gray = "#B0B0B0"
let s:salmon = "#CD5C57"
let s:emerald = "#64B041"
let s:pale_yellow = "#DADBB1"
let s:sky_blue = "#6CC7EB"
let s:cerulean = "#3D95E6"
let s:pink = "#FFA0A0"

" Background & Cursors
hi Visual guibg=#404040

" Color Assignments
exe 'hi Normal      guifg=' .s:pale_yellow    .' guibg=' .s:powder_black
exe 'hi LineNr      guifg=' .s:mid_gray       .' guibg=' .s:dark_gray       .' gui=none'

exe 'hi PreProc     guifg=' .s:salmon

exe 'hi Variable    guifg=' .s:cerulean
exe 'hi Operator    guifg=' .s:sky_blue                                     .' gui=bold'
exe 'hi Constant    guifg=' .s:pink

exe 'hi String      guifg=' .s:emerald
exe 'hi Comment     guifg=' .s:mid_gray                                     .' gui=italic'
