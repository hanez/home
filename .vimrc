" Execute pathogen
execute pathogen#infect()

" Load NERDTree plugin only if opening vim without a file
"autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Remember position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enable syntax highlighting
syntax on

" Show line numbers
set number
" Set line number color
" Get colors here:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight LineNr ctermfg=220 guifg=#ffd700

" Highlight current line and disable highlighting in insert mode
set cursorline 
hi CursorLine   cterm=NONE ctermbg=17 ctermfg=white guibg=#00005f guifg=white
"hi CursorColumn cterm=NONE ctermbg=17 ctermfg=white guibg=#00005f guifg=white
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Code indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Better command-line completion
set wildmenu

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
