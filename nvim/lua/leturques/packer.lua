-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Personalization for packer like popup window on packer
require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use


-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Catppuccin Theme
use({
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    require('leturques/plugins/catppuccin')
  end
})

-- One Dark Theme.
-- use({
--   'navarasu/onedark.nvim',
--   config = function()
--     require('leturques/plugins/onedark')
--   end,
-- })

-- Commenting support.
use 'tpope/vim-commentary'

-- Add, change, and delete surrounding text.
use 'tpope/vim-surround'

-- Useful commands like :Rename and :SudoWrite.
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b.
use('tpope/vim-unimpaired')

-- -- Indent autodetection with editorconfig support.
-- use('tpope/vim-sleuth')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Add more languages.
use 'sheerun/vim-polyglot'

-- Navigate seamlessly between Vim windows and Tmux panes
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- Split arrays and methods onto multiple lines, or join them back up.
use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
})

-- Automatically fix indentation when pasting code.
use({
  'sickill/vim-pasta',
  config = function()
    vim.g.pasta_disabled_filetypes = { 'fugitive' }
  end,
})

-- All closing buffers without closing the split window.
use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

-- Fuzzy finder
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('leturques/plugins/telescope')
  end,
})

-- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('leturques/plugins/nvim-tree')
  end,
})

-- Display indentation lines.
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('leturques/plugins/indent-blankline')
  end
})

-- Status line.
use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('leturques/plugins/lualine')
  end,
})

-- Add a dashboard
use({
  'glepnir/dashboard-nvim',
  config = function()
    require('leturques/plugins/dashboard-nvim')
  end
})

-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gB', ':Gitsigns blame_line<CR>')
  end
})

-- Git commands
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

-- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function ()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
  end
})

-- Improved syntax highlighting with tree-sitter
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'b0o/schemastore.nvim',
  },
  config = function()
    require('leturques/plugins/treesitter')
  end
})

use({
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    'neovim/nvim-lspconfig',             -- Required
    'williamboman/mason.nvim',           -- Optional
    'williamboman/mason-lspconfig.nvim', -- Optional
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',         -- Required
    'hrsh7th/cmp-nvim-lsp',     -- Required
    'hrsh7th/cmp-buffer',       -- Optional
    'hrsh7th/cmp-path',         -- Optional
    'saadparwaiz1/cmp_luasnip', -- Optional
    'hrsh7th/cmp-nvim-lua',     -- Optional
    'onsails/lspkind-nvim',

    -- Snippets
    'L3MON4D3/LuaSnip',             -- Required
  },
  config = function()
    require('leturques/plugins/lspconfig')
  end
})

-- PHP Refactoring Tools
use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
  config = function()
    vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
    vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
  end,
})

-- End of plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile>
  augroup end
]])
