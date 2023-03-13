
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'astro',
  'volar',
  'tailwindcss',
  'intelephense',
  'jsonls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.configure('volar', {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

lsp.configure('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local cmp_select = { behavior = cmp.SelectBehavior.Select }

require('luasnip/loaders/from_snipmate').lazy_load()

local cmp_mappings = lsp.defaults.cmp_mappings({
  -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

-- Primeagen config
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = { format = lspkind.cmp_format() },
  mapping = cmp_mappings,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  documentation = {
    max_height = 40,
    max_width = 60,
    border = 'rounded',
    col_offset = 0,
    side_padding = 1,
    winhighlight = 'Normal:TelescopeNormal,FloatBorder:TelescopePreviewBorder,CursorLine:Visual,Search:None',
    zindex = 1001
  }
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = '',
    warn = '',
    hint = '',
    info = ''
  }
})

-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

-- Commands
vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format({ async = true }) end, {})

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true
  }
})

