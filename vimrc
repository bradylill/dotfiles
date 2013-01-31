set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'pangloss/vim-javascript'
"Clojure
Bundle 'tpope/vim-foreplay'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'kien/rainbow_parentheses.vim'

filetype plugin indent on
syntax on

"I cant spel
setlocal spell spelllang=en_au

set noswapfile

set number

set hlsearch
set incsearch

set undolevels=3000
"set cindent

set nowrap
set smartindent tabstop=2 shiftwidth=2 expandtab

set wildmode=list:full,list:longest
set wildignore+=*.swp,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

map <Up> 
map <Down> 
map <Left> <Nop>
map <Right> <Nop>

imap <Up>     <Nop>
imap <Down>   <Nop>
imap <Left>   <Nop>
imap <Right>  <Nop>

map j gj
map k gk

map <space> :Eval<CR>

set showcmd

"Clojure
set viminfo+=!
au VimEnter * RainbowParenthesesToggle

"Ctrlp
let g:ctrlp_arg_map = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"Stylin
set t_Co=256
set background=dark
color Tomorrow-Night

"Key mappin
let mapleader = ","
let maplocalleader = "."

map <F3> :noh<CR>
map <F2> :NERDTree<CR>
map <F2> :NERDTree<CR>
