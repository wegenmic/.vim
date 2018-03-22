set nocompatible              " be iMproved, required

" ================ General Config ====================

set cursorline                  " highlight current line
set number                      " line number on the left side
set backspace=indent,eol,start  " allow backspace in insert mode
set history=1000                " store lots of :cmdline history
set showcmd                     " show incomplete cmds down the bottom
set showmode                    " show current mode down the bottom
set visualbell                  " no sounds
set autoread                    " reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn on syntax highlighting
syntax on

" ================ vim-plug Plugins ====================
" This loads all the plugins specified in ~/.vim/vim-plug.vim
" Use vim-plug to manage all plugins
if filereadable(expand("~/.vim/vim-plug.vim"))
  source ~/.vim/vim-plug.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Scrolling ========================

set scrolloff=8         " start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       " don't wrap lines
set linebreak    " wrap lines at convenient points

" ================ Search ===========================

set incsearch       " find the next match as we type the search
set hlsearch        " highlight searches by default
set ignorecase      " ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Mapping ==========================

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Leaving insert mode
inoremap jk <ESC>

" Prettify JSON
nmap =j :%!python -m json.tool<CR>
