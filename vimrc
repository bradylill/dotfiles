set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

"General
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'bling/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'christoomey/vim-tmux-navigator'

"Clojure
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-highlight'
Bundle 'vim-scripts/paredit.vim'

"Javascript
Bundle 'pangloss/vim-javascript'

"Puppet
Bundle 'rodjek/vim-puppet'

"GoLang
Bundle 'jnwhiteh/vim-golang'

"Arduino
Bundle 'sudar/vim-arduino-syntax'

filetype plugin indent on
syntax on

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

"Ruby
set tags+=gems.tags

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
hi Normal ctermfg=252 ctermbg=none

"Key mappin
let mapleader = ","
let maplocalleader = ","

"Airline
let g:airline#extensions#tabline#enabled = 1

"Misc
map <F3> :noh<CR>

"Navigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

"Splits
set splitbelow
set splitright

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

