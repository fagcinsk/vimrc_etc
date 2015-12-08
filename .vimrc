﻿set nocompatible

" ================ Vundle plugins ====================
filetype off
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/vundle')

let vundle_readme=expand(vimDir . '/bundle/vundle/README.md')

let hasPlugins=1

if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  execute 'silent !git clone https://github.com/gmarik/vundle "' . expand(vimDir . '/bundle/vundle') . '"'
  let hasPlugins=0
endif

call vundle#begin(expand(vimDir . '/bundle'))

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'groenewege/vim-less'

call vundle#end()


" ================ General Config ====================

set number                      "Line numbers are good
set relativenumber
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set undolevels=1000
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set guicursor=a:blinkon0        "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set tabpagemax=15               "Max tabs count
set laststatus=2                "Always how status line
set textwidth=120
set t_Co=256                    "Terminal colors
set cmdheight=2                 "Commands output height
set tildeop "~"
set esckeys                     "Function keys in Insert mode
set shortmess=at                "Confirm msg
set list listchars=tab:»\ ,trail:·
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set cursorline                  "Show horizontal line with cursor
set hidden                  "Buffers in bg
set ttyfast
set mat=2 " how many tenths of a second to blink
set magic


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cindent      "C indentation trigger

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=syntax   "fold based on ...
set foldnestmax=10       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.zip
set omnifunc=syntaxcomplete#Complete

" ================ Syntax ===========================

syntax on
filetype plugin indent on
color darcula
let g:airline_theme='tomorrow'

highlight Special ctermbg=NONE " TODO: DOES NOT WORKS make the highlighting of eols less annoying
highlight SpecialKey ctermbg=NONE " make the highlighting of tabs less annoying

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
match Todo 'TODO:'

" ================ Default file specs ===============

set encoding=utf-8
set ffs=unix,dos,mac

" ================ Map leader symbol ================

let mapleader=','
let g:mapleader=','

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

if has('gui')
  if has('win32')
    set guifont=Courier_New:h9:cRUSSIAN::
  else
    set guifont=Terminus\ 10
  endif
endif

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set showmatch

"execute pathogen#infect()

" ================ Mappings =========================

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>l mzgg=G`z
nmap <silent> <leader>x :!sh %<CR>

imap <C-d> <Esc>YPa

map <C-S-left> <C-w>h
map <C-S-right> <C-w>l
map <C-up> <C-w>k
map <C-down> <C-w>j

imap <silent> <leader><Tab> <Esc>:NERDTreeToggle<CR>a
nmap <silent> <leader><Tab> :NERDTreeToggle<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR>
"<space>

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Autocommands
autocmd BufWrite * :call DeleteTrailingWS()
autocmd BufNewFile,BufRead *.json set ai filetype=javascript

" Отображение кириллицы в меню
source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

" ================ Install plugins if needed ==========

if hasPlugins==0
  echo 'Installing plugins...'
  echo ''
  execute 'BundleInstall'
endif

" ================ Plugin specific settings ===========

let g:airline_left_sep=''
let g:airline_right_sep=''

" ================ Testbed ============================

