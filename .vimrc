" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/bbcode'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'cohama/lexima.vim'
Plug 'alvan/vim-closetag'
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Syntax highlighting
syntax on
set background=dark
color base16-material-dark

" .tsx files should be syntax highlighted like TypeScript
augroup SyntaxSettings
	autocmd!
	autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

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

" Line numbering (relative)
set number
set relativenumber

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

" Indent whole file
let @i = 'ggVG='

" Map CTRL-t to FZF
nnoremap <C-t> <Esc>:FZF<CR>

" Map CTRL-\ to NERDTreeToggle
nnoremap <C-\> <Esc>:NERDTreeToggle<CR>

" Map CTRL-\ to NERDTreeToggle
nnoremap <C-f> <Esc>:Ack! 

" Switch between different windows by their direction
no <C-j> <C-w>j
no <C-k> <C-w>k
no <C-l> <C-w>l
no <C-h> <C-w>h

" Change splits to be more intuitive (Ctrl-w - and Ctrl-w |)
no <C-w>- <C-w>n
no <C-w>\| :vnew<CR>

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

" Close NERDTree if only one window is left open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Change highlight on NERDTree to red/white
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white

" Change color of tab bar
:hi TabLineFill ctermbg=11
:hi TabLine ctermfg=6 ctermbg=11
:hi Title ctermfg=4
:hi TabLineSel ctermfg=4 ctermbg=0

" Change color of relative cursor line
:hi CursorLineNr ctermbg=0 ctermfg=3

" Vim Airline config
let g:airline_theme='angr'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.dirty='⚡'

" gitgutter 100ms update time
set updatetime=100

" gitgutter change highlight colors
highlight GitGutterAdd ctermfg=2 ctermbg=0
highlight GitGutterChange ctermfg=4 ctermbg=0
highlight GitGutterDelete ctermfg=1 ctermbg=0

" ESLint and Prettier config
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier']
 \ }

highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_sign_error = 'x'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

" ack
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

" tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" hit enter to select current option
inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "\<CR>"

function g:Multiple_cursors_before()
	call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
	call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction

" closetag config
let g:closetag_filetypes = 'html,xhtml,jsx,javascript'
let g:closetag_emptyTags_caseSensitive = 1
