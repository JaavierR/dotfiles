require('ibl').setup({
    exclude = {
        filetypes = {
          'help',
          'terminal',
          'dashboard',
          'packer',
          'lspinfo',
          'TelescopePrompt',
          'TelescopeResults',
        },
        buftypes = {
          'terminal',
          'NvimTree',
        },
    },
    scope = {
        enabled = true,
        show_end = true,
    }
})
