" css syntax file
" Language:     CSS
" Maintainer:   Tim Schofield
" Last Change:  2013 Dec 09

if exists("b:current_syntax")
  finish
endif

set iskeyword+=-

" Keywords
syn keyword cssConstant inherit none auto
syn keyword cssConstant normal bold italic
syn keyword cssConstant center left right
syn keyword cssConstant inline block inline-block list-item table inline-table
syn keyword cssConstant underline overline line-through blink
syn keyword cssConstant none disc circle square decimal decimal-leading-zero
syn keyword cssConstant lower-alpha upper-alpha lower-latin upper-latin
syn keyword cssConstant lower-roman upper-roman lower-greek
syn keyword cssConstant inside outside
syn keyword cssConstant dotted dashed solid double groove ridge inset outset
syn keyword cssConstant repeat repeat-x repeat-y
syn keyword cssConstant absolute relative

syn keyword cssKeyword color background-color
syn keyword cssKeyword border border-top border-bottom border-left border-right
syn keyword cssKeyword border-radius
syn keyword cssKeyword padding padding-top padding-bottom padding-left padding-right
syn keyword cssKeyword margin margin-top margin-bottom margin-left margin-right
syn keyword cssKeyword font font-family font-size font-weight font-style font-variant
syn keyword cssKeyword line-height text-indent text-align
syn keyword cssKeyword text-direction text-decoration text-transform
syn keyword cssKeyword letter-spacing word-spacing
syn keyword cssKeyword text-shadow box-shadow
syn keyword cssKeyword list-style-type list-style-position list-style-image
syn keyword cssKeyword display position width height min-width max-width min-height max-height
syn keyword cssKeyword background background-image background-size background-position
syn keyword cssKeyword background-repeat background-attachment
syn keyword cssKeyword top bottom z-index
syn keyword cssKeyword overflow opacity
syn keyword cssKeyword transition transition-property transition-duration
syn keyword cssKeyword transition-timing-function

" Matches
syn match cssConstant '\s[0-9]\+s'
syn match cssConstant '\s[.0-9]\+s'
syn match cssConstant '[.0-9]\+%'
syn match cssConstant '[.0-9]\+deg'
syn match cssConstant '[0-9]\+px'
syn match cssConstant '[.0-9]\+em'
syn match cssConstant '[.0-9]\+rem'
syn match cssConstant '#\x\{3}'
syn match cssConstant '#\x\{6}'

" Regions
syn region cssRGB start="rgb(" end=")"
syn region cssRGBa start="rgba(" end=")"

" Highlight Instructions
let b:current_syntax = "css"

hi def link cssConstant     Constant
hi def link cssRGB          Constant
hi def link cssRGBa         Constant

hi def link cssKeyword      Keyword
