-- Require lspconfig
local lspconfig = require('lspconfig')
-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

-- PHP
lspconfig.intelephense.setup({ capabilities = capabilities })

-- -- Python
lspconfig.pyright.setup({ capabilities = capabilities, filetypes = { "python" } })

-- Vue, JavaScript, TypeScript
lspconfig.volar.setup({
  capabilities = capabilities,
  -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
})

-- Tailwind CSS
lspconfig.tailwindcss.setup({ capabilities = capabilities })

-- Astro
lspconfig.astro.setup({
  capabilities = capabilities,
})

-- JSON
lspconfig.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

local null_ls = require('null-ls')

-- null-ls
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),

    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),

    null_ls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),

    null_ls.builtins.formatting.prettierd.with({
      ondition = function(utils)
        return utils.root_has_file({ '.prettierrc' })
      end
    }),

    -- Python linting
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = function()
        local virtual = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX') or  "/usr"
        return { '--python-executable', virtual .. '/bin/python' }
      end,
    }),
    null_ls.builtins.diagnostics.ruff,

    -- Python formatting
    null_ls.builtins.formatting.black.with({
      extra_args = { '--line-length', '88' },
    }),

    null_ls.builtins.formatting.isort,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

-- Commands
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      return client.name ~= "volar"
    end,
  })
end, {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- Keymaps
    vim.keymap.set('n', '<Leader>D', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  end,
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
