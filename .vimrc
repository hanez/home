" Managed plugins
call plug#begin()
  " List your plugins here
  Plug 'tpope/vim-sensible'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
  Plug 'flazz/vim-colorschemes'
  Plug 'vim-python/python-syntax'
  Plug 'preservim/nerdtree'
  Plug 'preservim/tagbar'
call plug#end()

" desert feral gentooish grb256 jellygrass kalt last256 matrix
colorscheme molokai 

" * User Interface

" dark background, by default
"set background=dark
" mouse selection
""set selectmode=mouse
" no beeping, please...
""set vb
" always show status line
""set laststatus=2
" display the current mode and partially-typed commands in the status line
""set showmode
""set showcmd
" default or informative status line
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
""set statusline=%<%f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c%V\ %)%P
" use '[RO]' for '[readonly]' to save space in the message line
""set shortmess+=r
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities
""set wildmode=list:longest,full

" Statusline
"set statusline=%f                          " File name
"set statusline+=%y                         " File type
"set statusline+=%m                         " Modified flag [+] if modified
"set statusline+=%r                         " Read-only flag [RO] if read-only
"set statusline+=%=                         " Right-align the next section
"set statusline+=%l/%L                      " Current line / Total lines
"set statusline+=\ [%p%%]                   " Percentage through the file
"set statusline+=%c                         " Column number
set laststatus=2     

" Reset statusline
set statusline=
" filename, relative to cwd
set statusline+=%f
" separator
set statusline+=\ 
" modified flag
set statusline+=%#wildmenu#
set statusline+=%m
set statusline+=%*
"Display a warning if file encoding isnt utf-8
set statusline+=%#question#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
"display a warning if fileformat isnt unix
set statusline+=%#directory#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
"display a warning if files contains tab chars
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
" read-only
set statusline+=%r
set statusline+=%*
" right-align
set statusline+=%=
" filetype
set statusline+=[%{strlen(&ft)?&ft:'none'}]
" separator
set statusline+=\ 
" current char
set statusline+=[%b],[0x%02B]
" separator
set statusline+=\ 
" column,
set statusline+=(C:%2c),
" current line / lines in file
set statusline+=[%l/%L]
" always show status line
set laststatus=2
" return '[tabs]' if tab chars in file, or empty string
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0

        if tabs
            let b:statusline_tab_warning = '[tabs]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction
"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning


" Load NERDTree plugin only if opening vim without a file
"autocmd VimEnter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree with Ctrl+n / Toggle
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <F8> :TagbarToggle<CR>

" Remember position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Set the clipboard so all vim instances share the same copy/paste buffer
set clipboard=unnamed

" Enable paste mode
set paste

" Enable syntax highlighting
syntax on

" Show line numbers
"set number
" Set line number color
" Get colors here:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
""highlight LineNr ctermfg=220 guifg=#ffd700

" Highlight current line and disable highlighting in insert mode
set cursorline 
""hi CursorLine   cterm=NONE ctermbg=17 ctermfg=white guibg=#00005f guifg=white
"hi CursorColumn cterm=NONE ctermbg=17 ctermfg=white guibg=#00005f guifg=white
""augroup CursorLine
""  au!
""  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
""  au InsertEnter * setlocal nocursorline
""  au InsertLeave * setlocal cursorline
""augroup END

" 256 bit color support
""set t_Co=256

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Ensure utf-8 encoding
set encoding=utf-8

" Code indentation
syntax enable
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" set number
" filetype indent on
" set autoindent

filetype indent off
set noautoindent
set nocindent
set nosmartindent

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

" Allow hidden buffers
set hidden

" * Load Additional Settings

" OS-specific configuration loading
let s:os=substitute(system('uname -s'), '\n', '', 'g')
let s:osfile=$HOME . '/.vim/local/os-' . s:os . '.vim'
if filereadable(s:osfile)
  execute 'source '. s:osfile
endif

" host-specific configuration loading
let s:hostfile=$HOME . '/.vim/local/host-' . hostname() . '.vim'
if filereadable(s:hostfile)
  execute 'source '. s:hostfile
endif

