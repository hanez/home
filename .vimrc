" Vim configuration from Johannes Findeisen <you@hanez.org>

" Managed plugins
call plug#begin()
  " List your plugins here
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'

  if hostname() == "jupiter"
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif

  Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
  Plug 'flazz/vim-colorschemes'
  Plug 'vim-python/python-syntax'
  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'preservim/tagbar'
call plug#end()

" desert feral gentooish grb256 jellygrass kalt last256 matrix
colorscheme molokai 

" Dark background, by default (is this needed when setting the colorsheme?).
set background=dark

" Mouse selection
set mouse=
set selectmode=mouse

" No beeping, please...
set vb

" Display the current mode and partially-typed commands in the status line
set showmode
set showcmd

" Highlight current line and disable highlighting in insert mode
set cursorline 

" Statusline
set laststatus=2     
set showtabline=2
"set statusline=
"set statusline=%f                          " File name
"set statusline+=%y                         " File type
"set statusline+=%m                         " Modified flag [+] if modified
"set statusline+=%r                         " Read-only flag [RO] if read-only
"set statusline+=%=                         " Right-align the next section
"set statusline+=%l/%L                      " Current line / Total lines
"set statusline+=\ [%p%%]                   " Percentage through the file
"set statusline+=%c                         " Column number

" ?
set guioptions-=e

" Reset statusline
set statusline=
" Filename, relative to cwd
set statusline+=%f
" Separator
set statusline+=\ 
" Modified flag
set statusline+=%#wildmenu#
set statusline+=%m
set statusline+=%*
" Display a warning if file encoding isnt utf-8
set statusline+=%#question#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
" Display a warning if fileformat isnt unix
set statusline+=%#directory#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
" Display a warning if files contains tab chars
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
" Read-only
set statusline+=%r
set statusline+=%*
" Right-align
set statusline+=%=
" Filetype
set statusline+=[%{strlen(&ft)?&ft:'none'}]
" Separator
set statusline+=\ 
" Current char
set statusline+=[%b],[0x%02B]
" Separator
set statusline+=\ 
" Column,
set statusline+=(C:%2c),
" Current line / lines in file
set statusline+=[%l/%L]
" Always show status line
set laststatus=2
" Return '[tabs]' if tab chars in file, or empty string
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
" Recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" Map Ctrl+n to :NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" Map F8 to :TagbarToggle
map <F8> :TagbarToggle<CR>

" Remember position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Set the clipboard so all vim instances share the same copy/paste buffer
set clipboard=unnamed

" Enable paste mode
"set paste

" Enable syntax highlighting
syntax on

" Show line numbers
"set number
" Set line number color
" Get colors here:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"highlight LineNr ctermfg=220 guifg=#ffd700
""set t_Co=256

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Ensure utf-8 encoding
set encoding=utf-8

" Code indentation
syntax enable
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"filetype indent off
"set noautoindent
"set nocindent
"set nosmartindent

" Show line number
"set number

" Better command-line completion
set wildmenu
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities
set wildmode=list:longest,full

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

" Automatically enable paste mode when pasting.
" https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim/38258720#38258720
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" OS-specific configuration
let s:os=substitute(system('uname -s'), '\n', '', 'g')
let s:osfile=$HOME . '/.vim/local/os-' . s:os . '.vim'
if filereadable(s:osfile)
  execute 'source '. s:osfile
endif

" host-specific configuration
let s:hostfile=$HOME . '/.vim/local/host-' . hostname() . '.vim'
if filereadable(s:hostfile)
  execute 'source '. s:hostfile
endif

