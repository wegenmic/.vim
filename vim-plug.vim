
" vim-plug configuration
" ========================================
"

" Automatic installation

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ========== NERDTree - file system explorer
Plug 'scrooloose/nerdtree'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" ========== vim-addon-mw-utils (needed for Plug 'vim-snipmate')
Plug 'MarcWeber/vim-addon-mw-utils'

" ========== tlib_vim (needed for Plug 'vim-snipmate')
Plug 'tomtom/tlib_vim'


" ========== NERDTree and tabs together in Vim, painlessly
Plug 'jistr/vim-nerdtree-tabs'
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" ========================================
" Appearance
" ========================================

" ========== vim-colors-solarized
Plug 'altercation/vim-colors-solarized'
set rtp+=~/.vim/plugged/vim-colors-solarized
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" ========== lightline.vim
Plug 'itchyny/lightline.vim'
set laststatus=2              " Use status bar even with single buffer
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? 'git '._ : ''
  endif
    return ''
endfunction

function! MyFilename()
    return ('' != expand('%') ? expand('%') : '[NoName]')
endfunction


" ========================================
" Git
" ========================================

" ========== gitv
Plug 'gregsexton/gitv'

" ========== vim-fugitive
Plug 'tpope/vim-fugitive'

" ========== vim-git
Plug 'tpope/vim-git'


" ========================================
" Search
" ========================================

" ========== IndexedSearch (At match #N out of M matches)
Plug 'vim-scripts/IndexedSearch'


" ========================================
" Language
" ========================================

" ========== vim-endwise (helps to end certain structures automatically)
Plug 'tpope/vim-endwise'

" ========== vim-polyglot (Large language pack)
Plug 'sheerun/vim-polyglot'
hi! def link Error ErrorMsg

" ========== vim-snipmate (snippets engine with tab support to jump)
Plug 'garbas/vim-snipmate'

" ========== vim-snippets using vim-snipmate engine
Plug 'honza/vim-snippets'



call plug#end()

