local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'bottom',
    },
    sorting_strategy = 'descending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sF',
  function()
    require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })
  end
)
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end
)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sg', require('telescope').extensions.live_grep_args.live_grep_args)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>s', require('telescope.builtin').lsp_document_symbols)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
