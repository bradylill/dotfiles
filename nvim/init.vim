if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'nightsense/snow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-salve'
Plug 'w0rp/ale'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'apalmer1377/factorus'
call plug#end()

syntax on
filetype plugin indent on
set noswapfile
set cc=81
set modelines=0
set noshowmode
set lazyredraw
set number
set incsearch
set undolevels=3000
set nowrap
set smartindent tabstop=2 shiftwidth=2 expandtab

set background=dark
colorscheme snow

let mapleader = " "
let maplocalleader = ","

tnoremap <esc> <C-\><C-n>

nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>fg  :GFiles<cr>
nnoremap <leader>ff  :Files<cr>
nnoremap <leader>bb  :Buffers<cr>
nnoremap <leader>cc  :Colors<cr>
nnoremap <leader>hh  :Helptags<cr>
nnoremap <leader>mm  :Maps<cr>
nnoremap <leader>sc  :noh<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gb  :Gblame<cr>
nnoremap <leader>gd  :Gdiff<cr>
nnoremap <leader>gl  :Commits<cr>
nnoremap <leader>bp  :bprevious<cr>
nnoremap <leader>dd  :Dispatch<cr>
nnoremap <leader>df  :FocusDispatch
vnoremap <leader>ea  :EasyAlign<cr><C-x>
nnoremap <leader>cpr :RunTests<cr>
nnoremap <leader>cpR :Eval (do (require '[clojure.tools.namespace.repl :as repl]) (repl/refresh))<cr>
nnoremap <leader>cpe :normal cpp<cr>
nnoremap <Leader>oa  :OmniSharpGetCodeActions<CR>
nnoremap <Leader>or  :OmniSharpRename<CR>
nnoremap <Leader>ou  :OmniSharpFindUsages<CR>
nnoremap <Leader>od  :OmniSharpGotoDefinition<CR>
nnoremap <Leader>os  :OmniSharpFindSymbol<CR>
nnoremap <Leader>of  :OmniSharpCodeFormat<CR>



let g:tmux_navigator_no_mappings=1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

autocmd FileType gitcommit set spell
autocmd QuickFixCmdPost *grep* cwindow

let g:strip_whitespace_on_save=1
let g:clojure_align_multiline_strings=1

" deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

" FZF + RG
let g:rg_command = '
  \ rg
  \ --colors "match:bg:yellow" --colors "match:fg:black"
  \ --colors "match:style:nobold" --colors "path:fg:green"
  \ --colors "path:style:bold" --colors "line:fg:yellow"
  \ --colors "line:style:bold"
  \ --column --line-number --no-heading --fixed-strings --ignore-case
  \ --hidden --follow --color "always" --glob "!{.git,node_modules}/**" '

command! -bang -nargs=* Find call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" GO support
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:airline#extensions#ale#enabled = 1

" Ale
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

" Omnisharp
"let g:OmniSharp_server_type = 'roslyn'
"let g:OmniSharp_server_path = join([expand('~'), '.omnisharp', 'run'], '/')
"let g:OmniSharp_selector_ui = 'fzf'
"let g:OmniSharp_start_server = 1
autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 expandtab

" Terraform
let g:terraform_align=1

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete
