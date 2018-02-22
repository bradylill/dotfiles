if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'clojure-vim/acid.nvim'
Plug 'bhurlow/vim-parinfer'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

filetype plugin indent on
syntax on
set noswapfile
set cc=81
set modelines=0
set noshowmode
set relativenumber
set incsearch
set undolevels=3000
set nowrap
set smartindent tabstop=2 shiftwidth=2 expandtab
set autochdir

color seoul256
set background=dark

let mapleader = " "
let maplocalleader = ","

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>ff  :GFiles<cr>
nnoremap <leader>bb  :Buffers<cr>
nnoremap <leader>cc  :Colors<cr>
nnoremap <leader>hh  :Helptags<cr>
nnoremap <leader>mm  :Maps<cr>
nnoremap <leader>sc  :noh<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gb  :Gblame<cr>
nnoremap <leader>gd  :Gdiff<cr>
nnoremap <leader>gl  :Commits<cr>
nnoremap <leader>sw  :StripWhitespace<cr>
nnoremap <leader>bp  :bprevious<cr>

let g:tmux_navigator_no_mappings=1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
autocmd FileType gitcommit set spell

highlight ExtraWhitespace ctermbg=Blue
