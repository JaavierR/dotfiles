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

-- One Dark Theme.
use({
        'jessarcher/onedark.nvim',
        config = function()
            vim.cmd('colorscheme onedark')

            vim.api.nvim_set_hl(0, 'FloatBorder', {
                    fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
                    bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
                })

            -- Make the cursor line bg invisible
            vim.api.nvim_set_hl(0, 'CursorLineBg', {
                    fg= vim.api.nvim_get_hl_by_name('CursorLine', true).background,
                    bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
                })
        end,
    })

-- Commenting support.
use 'tpope/vim-commentary'

-- Add, change, and delete surrounding text.
use 'tpope/vim-surround'

-- Add more languages.
use 'sheerun/vim-polyglot'

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


-- End of plugins
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile>
    augroup end
]])
