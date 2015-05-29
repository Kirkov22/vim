augroup file_haml
  autocmd!
  " Comment line
  autocmd FileType haml nnoremap <buffer> <localleader>c I-# <esc>
  " Comment selected lines
  autocmd FileType haml vnoremap <buffer> <localleader>c :s/\(^\s*\)/\1-# /<enter>
  " Uncomment line
  autocmd FileType haml nnoremap <buffer> <localleader>u :s/-#\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType haml vnoremap <buffer> <localleader>u :s/-#\s\=//<enter>
augroup END

augroup file_java
  autocmd!
  " Comment line
  autocmd FileType java* nnoremap <buffer> <localleader>c gI// <esc>
  " Comment selected lines
  autocmd FileType java* vnoremap <buffer> <localleader>c :s/^/\/\/ /<enter>
  " Uncomment line
  autocmd FileType java* nnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType java* vnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
augroup END

augroup file_c
  autocmd!
  " Comment line
  autocmd FileType c* nnoremap <buffer> <localleader>c gI// <esc>
  " Comment selected lines
  autocmd FileType c* vnoremap <buffer> <localleader>c :s/^/\/\/ /<enter>
  " Uncomment line
  autocmd FileType c* nnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType c* vnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
augroup END

augroup file_rust
  autocmd!
  " Comment line
  autocmd FileType rust nnoremap <buffer> <localleader>c gI// <esc>
  " Comment selected lines
  autocmd FileType rust vnoremap <buffer> <localleader>c :s/^/\/\/ /<enter>
  " Uncomment line
  autocmd FileType rust nnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType rust vnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
augroup END

augroup file_haskell
  autocmd!
  " Comment line
  autocmd FileType haskell nnoremap <buffer> <localleader>c gI-- <esc>
  " Comment selected lines
  autocmd FileType haskell vnoremap <buffer> <localleader>c :s/^/-- /<enter>
  " Uncomment line
  autocmd FileType haskell nnoremap <buffer> <localleader>u :s/--\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType haskell vnoremap <buffer> <localleader>u :s/--\s\=//<enter>
augroup END

augroup file_ruby
  autocmd!
  " Comment line
  autocmd FileType ruby nnoremap <buffer> <localleader>c gI# <esc>
  " Comment selected lines
  autocmd FileType ruby vnoremap <buffer> <localleader>c :s/^/# /<enter>
  " Uncomment line
  autocmd FileType ruby nnoremap <buffer> <localleader>u :s/#\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType ruby vnoremap <buffer> <localleader>u :s/#\s\=//<enter>
augroup END

augroup file_sass
  autocmd!
  " Comment line
  autocmd FileType sass nnoremap <buffer> <localleader>c I//<esc>
  " Comment selected lines
  autocmd FileType sass vnoremap <buffer> <localleader>c :s/\(^\s*\)/\1\/\/ /<enter>
  " Uncomment line
  autocmd FileType sass nnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType sass vnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
augroup END

augroup file_scss
  autocmd!
  " Comment line
  autocmd FileType scss nnoremap <buffer> <localleader>c I//<esc>
  " Comment selected lines
  autocmd FileType scss vnoremap <buffer> <localleader>c :s/\(^s*\)/\1\/\/ /<enter>
  " Uncomment line
  autocmd FileType scss nnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType scss vnoremap <buffer> <localleader>u :s/\/\/\s\=//<enter>
augroup END

augroup file_vim
  autocmd!
  " Comment line
  autocmd FileType vim nnoremap <buffer> <localleader>c gI" <esc>
  " Comment selected lines
  autocmd FileType vim vnoremap <buffer> <localleader>c :s/^/" /<enter>
  " Uncomment line
  autocmd FileType vim nnoremap <buffer> <localleader>u :s/"\s\=//<enter>
  " Uncomment selected lines
  autocmd FileType vim vnoremap <buffer> <localleader>u :s/"\s\=//<enter>
augroup END

augroup file_sh
  autocmd!
  " Comment line
  autocmd FileType z\=sh nnoremap <buffer> <localleader>c I# <esc>
  " Uncomment line
  autocmd FileType z\=sh nnoremap <buffer> <localleader>u :s/# //<enter>
augroup END
