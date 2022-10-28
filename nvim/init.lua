-- Plugs
local Plug = vim.fn['plug#']

vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')
Plug('neovim/nvim-lspconfig', { commit = '99596a8' })

Plug('christoomey/vim-tmux-navigator', { commit = '9ca5bfe' })

Plug('nvim-lua/plenary.nvim', { commit = '1da13ad' })
Plug('nvim-telescope/telescope.nvim', { commit = 'cd9e6aa' })
Plug('nvim-treesitter/nvim-treesitter', { commit = '26abd5f' })
Plug('nvim-lualine/lualine.nvim', { commit = 'c12b167' })

Plug('hrsh7th/nvim-cmp', { commit = '033a817' })
Plug('hrsh7th/cmp-nvim-lsp', { commit = 'affe808' })
Plug('hrsh7th/vim-vsnip', { commit = '8f199ef' })
Plug('hrsh7th/cmp-vsnip', { commit = '0abfa18' })

Plug('sheerun/vim-polyglot', { tag = 'v4.17.1' })

Plug('junegunn/seoul256.vim', { commit = '8f3dd7d' })

Plug('eraserhd/parinfer-rust', { tag = 'v0.4.3', ['do'] = 'cargo build --release'})
vim.fn['plug#end']()

-- Common nvim config
vim.cmd([[ syntax on ]])
vim.g.mapleader = " "
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.seoul256_background = 234
vim.cmd([[ colorscheme seoul256 ]])
vim.highlight.create('normal', {guibg=000000}, false)

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
    vim.cmd([[ colorscheme seoul256-light ]])
  else
    vim.opt.background = 'dark'
    vim.g.seoul256_background = 234
    vim.cmd([[ colorscheme seoul256 ]])
  end

  vim.highlight.create('normal', {guibg=000000}, false)
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
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<cr>')
map('n', '<leader>gt', ':lua vim.lsp.buf.type_definition()<cr>')
map('n', '<leader>dh', ':lua vim.lsp.buf.hover()<cr>')

-- vim.api.nvim_create_autocmd('CursorHold', {
--     command = 'lua vim.lsp.buf.document_highlight()'
--   })

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
require'lspconfig'.jsonls.setup {}

-- Terraform
require'lspconfig'.terraformls.setup {}

-- Clojure
require'lspconfig'.clojure_lsp.setup{}

-- Rust
require'lspconfig'.rust_analyzer.setup {}

-- Ruby
require'lspconfig'.solargraph.setup {}

--Telescope
require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.5 },
  }
}
map('n', '<leader>fa', ':Telescope find_files<cr>')
map('n', '<leader>ff', ':Telescope git_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fc', ':Telescope grep_string<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')
map('n', '<leader>fh', ':Telescope help_tags<cr>')

--LuaLine
require('lualine').setup()

