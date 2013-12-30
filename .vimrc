color twilight
" Always show the status line
set laststatus=2
" File name[filetype], Current Line / Total Lines
set statusline=%t
set statusline+=%y
set statusline+=,\ Line:\ %l
set statusline+=\/\ %L
" On right side, relative path to file
set statusline+=%=
set statusline+=%f
" Show line numbers, 3 digits wide by default
set number
set numberwidth=4
" Ignore case in search patterns
set ignorecase
" Begin wrapping 8 characters from window border
set wrapmargin=8
" Begin new lines with indent from previous line
set autoindent
" Turn on enhanced command line completion
set wildmenu
" Use spaces in place of tabs
set expandtab
" Tab-stop = 2
set tabstop=2
set shiftwidth=2
" Place swap files in ...
set directory=~/tmp
" Enable filetype plugins
filetype plugin on

" --------
" Mappings
" --------

" Leader key
let mapleader = ","
let maplocalleader = "\\"

" Alternative exit from Insert Mode
inoremap jk <esc>

" UPPERCASE the Current Word
inoremap <c-u> <esc>lviwUi
nnoremap <c-u> viwU

" Alternative 'to beginning/end of line'
nnoremap H ^
nnoremap L $

" Alternative to 'in-parenthesis'
onoremap p i(

" Replace 'next parenthesis'/'last parenthesis'
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

augroup file_ruby
  autocmd!
  " Comment line shortcut
  autocmd FileType ruby nnoremap <buffer> <localleader>c gI# <esc>
  " Uncomment line shortcut
  autocmd FileType ruby nnoremap <buffer> <localleader>u :s/#\s\=// <enter>
augroup END

augroup file_sass
  autocmd!
  " Comment line shortcut
  autocmd FileType sass nnoremap <buffer> <localleader>c I//<esc>
  " Uncomment line shortcut
  autocmd FileType sass nnoremap <buffer> <localleader>u :s/\/\/\s\=// <enter>
augroup END

augroup file_scss
  autocmd!
  " Comment line shortcut
  autocmd FileType scss nnoremap <buffer> <localleader>c I//<esc>
  " Uncomment line shortcut
  autocmd FileType scss nnoremap <buffer> <localleader>u :s/\/\/\s\=// <enter>
augroup END

augroup file_vim
  autocmd!
  " Comment line shortcut
  autocmd FileType vim  nnoremap <buffer> <localleader>c gI" <esc>
  " Uncomment line shortcut
  autocmd FileType vim  nnoremap <buffer> <localleader>u :s/"\s\=// <enter>
augroup END


" Add blank lines but stay in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Move between vertical windows
noremap <c-H> <c-W>h
noremap <c-L> <c-W>l

" Move between horizontal windows
noremap <c-J> <c-W>j<c-W>_
noremap <c-K> <c-W>k<c-W>_

" Disable arrow keys in normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
noremap <F9> :tabn<CR>
