-- Plugs
vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')
vim.fn['plug#']('neovim/nvim-lspconfig', { commit = '99596a8' })

vim.fn['plug#']('christoomey/vim-tmux-navigator', { commit = '9ca5bfe' })

vim.fn['plug#']('nvim-lua/plenary.nvim', { commit = '1da13ad' })
vim.fn['plug#']('nvim-telescope/telescope.nvim', { commit = 'cd9e6aa' })
vim.fn['plug#']('nvim-treesitter/nvim-treesitter', { commit = '26abd5f' })
vim.fn['plug#']('nvim-lualine/lualine.nvim', { commit = 'c12b167' })

vim.fn['plug#']('hrsh7th/nvim-cmp', { commit = '033a817' })
vim.fn['plug#']('hrsh7th/cmp-nvim-lsp', { commit = 'affe808' })

vim.fn['plug#']('sheerun/vim-polyglot', { tag = 'v4.17.1' })

vim.fn['plug#']('junegunn/seoul256.vim', { commit = '8f3dd7d' })
vim.fn['plug#end']()

-- Common nvim config
vim.cmd([[ syntax on ]])
vim.g.mapleader = " "
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.seoul256_background = 234
vim.cmd([[ colorscheme seoul256 ]])

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

-- Helper functions
function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command)
end

-- Keymappings
map('n', '<leader>fed', ':e $MYVIMRC<cr>')
map('n', '<leader>fer', ':source $MYVIMRC<cr>')
map('n', '<leader>sc', ':noh<cr>')

-- nvim-cmp
local cmp = require'cmp'

cmp.setup {
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

-- Terraform
require'lspconfig'.terraformls.setup {}

--Telescope
map('n', '<leader>fa', ':Telescope find_files<cr>')
map('n', '<leader>ff', ':Telescope git_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fc', ':Telescope grep_string<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')
map('n', '<leader>fh', ':Telescope help_tags<cr>')

--LuaLine
require('lualine').setup()

