-- Plugs
local Plug = vim.fn['plug#']

vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')
Plug('neovim/nvim-lspconfig')

Plug('christoomey/vim-tmux-navigator', { commit = 'bd4c38b' })

Plug ('junegunn/fzf', { commit = '168829b', dir = '~/.fzf', ['do'] = './install --all' })
Plug ('junegunn/fzf.vim', { commit = '9ceac71' })

Plug('nvim-lualine/lualine.nvim', { commit = '3325d5d' })

Plug('hrsh7th/nvim-cmp', { commit = '033a817' })
Plug('hrsh7th/cmp-nvim-lsp', { commit = 'affe808' })
Plug('hrsh7th/vim-vsnip', { commit = '8f199ef' })
Plug('hrsh7th/cmp-vsnip', { commit = '0abfa18' })

Plug('sheerun/vim-polyglot', { commit = '1d1f36b' })

Plug('junegunn/seoul256.vim')
Plug('folke/tokyonight.nvim')

Plug('ggandor/leap.nvim', { commit = 'ba42417' })
Plug('tpope/vim-repeat', { commit = '24afe92' })

Plug('eraserhd/parinfer-rust', { tag = 'v0.4.3', ['do'] = 'cargo build --release'})

Plug('tpope/vim-fireplace', { commit = 'b6bef83' })

Plug('chrisbra/csv.vim', { commit = '2fcac76' })

Plug('evanleck/vim-svelte', { branch = 'main' })

Plug('github/copilot.vim')
vim.g.copilot_enabled = false

vim.fn['plug#end']()

-- Common nvim config
vim.cmd([[ syntax on ]])
vim.g.mapleader = " "
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.background = 'dark'
--vim.g.seoul256_background = 234
vim.cmd([[ colorscheme tokyonight ]])

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.undodir = os.getenv('HOME') .. '/.vimud'
vim.opt.undofile = true

vim.opt.cmdheight = 2

vim.opt.list = true
vim.opt.listchars = { tab = '>~', nbsp = '¬', extends = '»', precedes = '«', trail = '•'   }

vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.swapfile = false

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Helper functions
function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command)
end

function toggleDarkMode()
  local current = vim.opt.background._value;

  if (current == 'dark') then
    vim.opt.background = 'light'
    vim.g.seoul256_background = 254
    vim.cmd([[ colorscheme tokyonight-day ]])
  else
    vim.opt.background = 'dark'
    vim.g.seoul256_background = 234
    --vim.cmd([[ colorscheme seoul256 ]])
    vim.cmd([[ colorscheme tokyonight ]])
  end

  --vim.highlight.create('normal', {guibg=000000}, false)
end

-- Keymappings
map('n', '<leader>fed', ':e $MYVIMRC<cr>')
map('n', '<leader>fer', ':source $MYVIMRC<cr>')
map('n', '<leader>sc', ':noh<cr>')
map('n', '<leader>tc', ':lua toggleDarkMode()<cr>')

-- LSP
map('n', '<F2>', ':lua vim.lsp.buf.rename()<cr>')
map('n', '<leader>fr', ':lua vim.lsp.buf.references()<cr>')
map('n', '<leader>fi', ':lua vim.lsp.buf.implementation()<cr>')
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')
map('v', '<leader>ca', ':lua vim.lsp.buf.range_code_action()<cr>')
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<cr>')
map('n', '<leader>gt', ':lua vim.lsp.buf.type_definition()<cr>')
map('n', '<leader>dh', ':lua vim.lsp.buf.hover()<cr>')

map('n', '<leader>cpe', ':Copilot enable<cr>')
map('n', '<leader>cpd', ':Copilot disable<cr>')

-- TODO: Fix this from spamming errors if filetype is not supported
-- either user silent! or scope to specific filetypes
--
-- vim.api.nvim_create_autocmd('CursorHold', {
--   command = 'lua vim.lsp.buf.document_highlight()'
-- })

-- nvim-cmp
local cmp = require'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  })
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Typescript
require'lspconfig'.tsserver.setup {}

-- eslint/json/html/css
require'lspconfig'.eslint.setup {}
require'lspconfig'.html.setup {}
require'lspconfig'.cssls.setup {}
--require'lspconfig'.jsonls.setup {}

-- Terraform
require'lspconfig'.terraformls.setup {}

-- Clojure
require'lspconfig'.clojure_lsp.setup{}
map('n', '<leader>cpr', ':RunTests<cr>')
map('n', '<leader>cpR', ':Eval (do (require \'[clojure.tools.namespace.repl :as repl]) (repl/refresh))<cr>')
map('n', '<leader>cpx', ':Eval (clojure.pprint/pprint *e)<cr>')

-- Rust
require'lspconfig'.rust_analyzer.setup {}

-- Ruby
require'lspconfig'.solargraph.setup {}

-- FZF
map('n', '<leader>fa', ':Files<cr>')
map('n', '<leader>ff', ':GFiles<cr>')
map('n', '<leader>fg', ':Rg<cr>')
map('n', '<leader>fc', ':Commits<cr>')
map('n', '<leader>fb', ':Buffers<cr>')
map('n', '<leader>fh', ':Helptags<cr>')

--LuaLine
require('lualine').setup()

-- Svelte
require'lspconfig'.svelte.setup {}

--Leap
local leap = require('leap')
leap.add_default_mappings()

-- Python
require'lspconfig'.pyright.setup {}
