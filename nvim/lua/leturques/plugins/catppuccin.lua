local custom_highlights = {
    Normal = { bg = "none" },
    NormalFloat = { bg = "none" },
    FloatBorder = { fg = "#31353F", bg = "none" },
    -- Telescope
    TelescopeNormal = { bg = "none" },
    TelescopePromptNormal = { fg = "#E7E5E4", bg = "none" },
    TelescopePromptBorder = { fg = "#383B51", bg = "none" },
    TelescopePreviewBorder = { fg = "#383B51", bg = "none" },
    TelescopeResultsBorder = { fg = "#383B51", bg = "none" },
    -- Selection
    TelescopeSelection = { bg = "#35374b" },
    -- Titles
    TelescopeTitle = { fg = "#A8A29E", bg = "none" },
    TelescopePromptTitle = { fg = "#A8A29E", bg = "none" },
    TelescopeResultsTitle = { fg = "#A8A29E", bg = "none" },
    TelescopePreviewTitle = { fg = "#121212", bg = "#0D9488" },
    -- Floaterm
    Floaterm = { bg = "none" },
    FloatermBorder = { fg = "#383B51", bg = "none" },
    -- NvimTree
    NvimTreeIndentMarker = { fg = "#383B51" },
    -- IndentBlank
    IndentBlanklineChar = { fg = "#383B51" },
}

require('catppuccin').setup({
    transparent_background = true,
    flavour = 'frappe',
    highlight_overrides = {
        all = function()
            return custom_highlights
        end
    },
})

vim.cmd.colorscheme 'catppuccin'
