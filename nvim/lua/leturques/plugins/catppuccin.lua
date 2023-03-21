local custom_highlights = {
    FloatBorder = { fg = "#31353F", bg = "#31353F"},

    -- Telescope
    TelescopeNormal = { bg = "#262626" },
    TelescopePromptNormal = { fg = "#E7E5E4", bg = "#212121" },
    TelescopePromptBorder = { fg = "#212121", bg = "#212121" },
    TelescopePreviewBorder = { fg = "#262626", bg = "#262626" },
    TelescopeResultsBorder = { fg = "#262626", bg = "#262626" },

    TelescopeSelection = { bg = "#44403C" },

    TelescopeTitle = { fg = "#78716C", bg = "#262626" },
    TelescopePromptTitle = { fg = "#78716C", bg = "#262626" },
    TelescopeResultsTitle = { fg = "#78716C", bg = "#262626" },
    TelescopePreviewTitle = { fg = "#121212", bg = "#0D9488" },

    -- Floaterm
    Floaterm = { bg = "#262626" },
    FloatermBorder = { fg = "#262626", bg = "#262626" },

    -- NvimTree
    NvimTreeIndentMarker = { fg = "#30323E" },

    -- IndentBlank
    IndentBlanklineChar = { fg = "#2F313C" },
}

require('catppuccin').setup({
    flavour = 'frappe',
    highlight_overrides = {
        all = function()
            return custom_highlights
        end
    },
})

vim.cmd.colorscheme 'catppuccin'

