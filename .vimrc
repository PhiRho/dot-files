source ./vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

"From personal taste
set history=50
set ruler
set showcmd
set incsearch

" highlighting
syntax on
set background=dark
set cursorline

" tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set smarttab

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

if has("autocmd")
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
else
  set autoindent
endif

