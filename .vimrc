" Execute pathogen
execute pathogen#infect()

" Load NERDTree plugin
"autocmd VimEnter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Remember position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enable syntax highlighting
syntax on

" Code indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
