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
call plug#end()

syntax on
set noswapfile
set cc=81
set modelines=0
set noshowmode
set relativenumber
set hlsearch
set incsearch
set undolevels=3000
set nowrap
set smartindent tabstop=2 shiftwidth=2 expandtab
set autochdir

color seoul256
set background=dark

let mapleader = " "

tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>fed :e $MYVIMRC<cr>
nnoremap <Leader>fer :source $MYVIMRC<cr>
nnoremap <Leader>ff  :GFiles<cr>
nnoremap <Leader>bb  :Buffers<cr>
nnoremap <Leader>sc  :noh<cr>

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
autocmd FileType gitcommit set spell
