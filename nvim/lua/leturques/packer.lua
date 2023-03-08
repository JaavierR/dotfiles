-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Personalization for packer like popup window on packer
require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    --display = {
    --    open_fn = function()
    --        return require('packer.util').float({ border = 'solid' })
    --    end,
    --},
})

local use = require('packer').use

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Commenting support.
use 'tpope/vim-commentary'

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile>
    augroup end
]])
