set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"General
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'

"Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'vim-scripts/paredit.vim'

"Javascript
Plugin 'pangloss/vim-javascript'

"Puppet
Plugin 'rodjek/vim-puppet'

"GoLang
Plugin 'fatih/vim-go'

"Arduino
Plugin 'sudar/vim-arduino-syntax'

"OpenGl
Plugin 'tikhomirov/vim-glsl'

"C/C++
"Bundle "gilligan/vim-lldb"

call vundle#end()

filetype plugin indent on
syntax on

set noswapfile

set number
set cc=81
set modelines=0
set noshowmode
set cursorline
set relativenumber

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

set backspace=2


set showcmd

"Ruby
set tags+=gems.tags

"Clojure
set viminfo+=!
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:clojure_align_multiline_strings = 1
au FileType clojure nmap <space> :Eval<CR>
au FileType clojure nmap <leader><space> :%Eval<CR>

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
let g:airline_theme='badwolf'
set laststatus=2

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

"Better whitespace
highlight ExtraWhitespace ctermbg=Blue
nmap <Leader>s :StripWhitespace<CR>

"Golang support (defaults from fatih/vim-go readme)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)

"Tagbar
nmap <F2> :TagbarToggle<CR>

"Make
au Filetype c   nmap <Leader>m :make<cr>
au Filetype cpp nmap <Leader>m :make<cr>
