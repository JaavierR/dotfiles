-- vim-grepper

return {
  'mhinz/vim-grepper',
  config = function()
    vim.keymap.set('n', '<Leader>R', ':Grepper -tool rg -query <CR>')
  end
}
