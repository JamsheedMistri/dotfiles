" Syntax highlighting
syntax on
set background=dark
color base16-material-dark

" Tab width
set tabstop=4

" New lines inherit the indentation of previous lines.
set autoindent

" Enable indentation rules that are file-type specific
filetype indent on

" When shifting lines, round the indentation to the nearest multiple of "shiftwidth." 
set shiftround

" When shifting, indent using four spaces.
set shiftwidth=4

" Line numbering
set number

" Show command
set showcmd

" Show matching bracket
set showmatch

" Show autocomplete menu when you hit tab
set wildmenu

" Start highlighting as soon as you start typing for a search
set incsearch

" Highlight all search instances
set hlsearch

" Ignore case when searching
set ignorecase

" Automatically switch search to case-sensitive when search query contains an uppercase letter
set smartcase

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Key bindings for moving down and up on the same (wrapped) line
nnoremap j gj
nnoremap k gk

" Insert line above and below cursor
let @p = 'ok'

" Always try to show a paragraph’s last line
set display+=lastline

" Use an encoding that supports unicode
set encoding=utf-8

" Avoid wrapping a line in the middle of a word
set linebreak

" The number of screen lines to keep above and below the cursor
set scrolloff=1

" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5

" Enable line wrapping
set wrap

" Always show cursor position
set ruler

" Allow mouse usage
set mouse=a

" Allow backspacing over indention, line breaks and insertion start
set backspace=indent,eol,start

" Directory to store backup and swap files
set backupdir=~/.vim/cache
set dir=~/.vim/cache

" Increase the undo limit
set history=1000

" Whitespace detectors
set list
set listchars=tab:\|\ ,trail:·,nbsp:␣

" Lazy redraw (better performance)
set lazyredraw

" If this many ms goes by and nothing is typed, the file will be saved to swap
set updatetime=500

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Better JavaScript syntax highlighting
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NerdTree - Switch between different windows by their direction
no <C-j> <C-w>j| "switching to below window 
no <C-k> <C-w>k| "switching to above window
no <C-l> <C-w>l| "switching to right window 
no <C-h> <C-w>h| "switching to left window

" Automatically start NERDTree when starting Vim
autocmd vimenter * NERDTree

" Allow opening of directories using the Vim command line command
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

" Change highlight on NERDTree to red/white
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
