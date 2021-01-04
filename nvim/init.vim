if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
"Git
Plug 'rbong/vim-flog'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Navigation/Search
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-projectionist'

"Themes/Gui
Plug 'nightsense/snow'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

"Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sebdah/vim-delve'

"Rust
Plug 'rust-lang/rust.vim'

"Clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

"Python
Plug 'vim-scripts/indentpython.vim'

"Terraform
Plug 'hashivim/vim-terraform'

"C#
Plug 'OmniSharp/omnisharp-vim'

"Lint
Plug 'w0rp/ale'

"Text manipulation
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'

"Build tools
Plug 'tpope/vim-dispatch'

"Other
Plug 'AndrewRadev/linediff.vim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"Plug 'euclio/vim-markdown-composer', { 'do': 'cargo build --release' }
"Plug 'junegunn/goyo.vim'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"Plug 'tpope/vim-flagship'
"Plug 'zchee/deoplete-jedi'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
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
set inccommand=nosplit
set undodir=~/.vimud
set undofile
set nowrap
set smartindent tabstop=2 shiftwidth=2 expandtab softtabstop=2
set hidden
set encoding=utf-8
set synmaxcol=200
set cmdheight=2
set updatetime=300
set omnifunc=syntaxcomplete#Complete
set list

set background=dark
colorscheme one
highlight Normal guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
let g:one_allow_italics = 1
set t_Co=256
set termguicolors
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

let mapleader = " "
let maplocalleader = ","

tnoremap <Esc> <C-\><C-n>

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
nnoremap <leader>gf  :Flog<cr>
nnoremap <leader>bp  :bprevious<cr>
nnoremap <leader>dd  :Dispatch<cr>
nnoremap <leader>df  :FocusDispatch
vnoremap <leader>ea  :EasyAlign<cr><C-x>
nnoremap <leader>cpr :RunTests<cr>
nnoremap <leader>cpR :Eval (do (require '[clojure.tools.namespace.repl :as repl]) (repl/refresh))<cr>
nnoremap <leader>cpx :Eval (clojure.pprint/pprint *e)<cr>
nnoremap <leader>cpe :normal cpp<cr>
nnoremap <leader>rrt :RustTest<cr>
nnoremap <leader>cfu :OmniSharpFindUsages<cr>
nnoremap <leader>cgd :OmniSharpGotoDefinition<cr>
nnoremap <leader>cfi :OmniSharpFindImplementations<cr>
nnoremap <leader>cfs :OmniSharpFindSymbol<cr>
nnoremap <leader>cfm :OmniSharpFindMembers<cr>
nnoremap <leader>cfd :OmniSharpDocumentation<cr>
nnoremap <leader>ctt :OmniSharpRunTest<cr>
nnoremap <leader>ctf :OmniSharpRunTestsInFile<cr>
nnoremap <leader>crr :OmniSharpRename<cr>
nnoremap <leader>cca :OmniSharpGetCodeActions<cr>
nnoremap <leader>ccf :OmniSharpCodeFormat<cr>
nnoremap <leader>ccc :OmniSharpGlobalCodeCheck<cr>
nnoremap <leader>cor :OmniSharpRestartAllServer<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:tmux_navigator_no_mappings=1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

autocmd FileType gitcommit set spell

let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

let g:clojure_align_multiline_strings=1

" Deoplete
let g:deoplete#enable_at_startup=1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call deoplete#custom#option('sources', {
  \ 'cs': ['omnisharp'],
  \ })

" Ale
let g:ale_fix_on_save=1
let g:ale_fixers = {
\     'python': ['isort', 'autopep8']
\}
let b:ale_fixers = ['eslint', 'terraform']

" FZF + RG
let g:rg_command = '
  \ rg
  \ --colors "match:bg:yellow" --colors "match:fg:black"
  \ --colors "match:style:nobold" --colors "path:fg:green"
  \ --colors "path:style:bold" --colors "line:fg:yellow"
  \ --colors "line:style:bold"
  \ --column --line-number --no-heading --fixed-strings --smart-case
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
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
highlight ALEErrorSign ctermbg=none ctermfg=red
highlight ALEWarningSign ctermbg=none ctermfg=yellow

" Vim Rooter
let g:rooter_patterns = ['project.clj', '.git/']

" Rust
let g:rustfmt_autosave = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['~/.pyenv/shims/pyls'],
    \ }

" C
let g:ale_c_gcc_options = '-std=c99 -Wall'
let g:ale_c_gcc_executable = 'cc'

" Python
let g:SimplyFold_docstring_preview=1
let g:python3_host_prog = '/home/brady/.pyenv/versions/neovim3/bin/python'
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" C#
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'

" Vim LightLine
let g:lightline = { 'colorscheme': 'one' }
let g:lightline.component = {
      \ 'filename': '%f',
      \}
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

set secure
