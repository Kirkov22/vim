color twilight
set number
set ignorecase
set wrapmargin=8
set autoindent
set wildmenu
set expandtab
set tabstop=2
set shiftwidth=2
set directory=~/tmp
filetype plugin on
" --------
" Mappings
" --------

" Leader key
let mapleader = ","
let maplocalleader = "\\"

" Alternative exit from Insert Mode
inoremap jk <esc>

" Capitalize the Current Word
inoremap <c-u> <esc>lviwUi
nnoremap <c-u> viwU

" Alternative 'to beginning/end of line'
nnoremap H ^
nnoremap L $

augroup file_ruby
  autocmd!
  " Comment line shortcut
  autocmd FileType ruby nnoremap <buffer> <localleader>c gI# <esc>
  " Uncomment line shortcut
  autocmd FileType ruby nnoremap <buffer> <localleader>u s/#//
augroup END

augroup file_sass
  autocmd!
  " Comment line shortcut
  autocmd FileType sass nnoremap <buffer> <localleader>c I//<esc>
  " Uncomment line shortcut
  autocmd FileType sass nnoremap <buffer> <localleader>u s/\/\///
augroup END

augroup file_vim
  autocmd!
  " Comment line shortcut
  autocmd FileType vim  nnoremap <buffer> <localleader>c gI" <esc>
  " Uncomment line shortcut
  autocmd FileType vim  nnoremap <buffer> <localleader>u s/"//
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
