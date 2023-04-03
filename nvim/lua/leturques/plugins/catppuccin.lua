local custom_highlights = {
    -- Telescope
    TelescopeNormal = { bg = "none" },
    TelescopePromptNormal = { fg = "#E7E5E4", bg = "none" },
    TelescopePromptBorder = { fg = "#515678", bg = "none" },
    TelescopePreviewBorder = { fg = "#515678", bg = "none" },
    TelescopeResultsBorder = { fg = "#515678", bg = "none" },
    -- Selection
    TelescopeSelection = { bg = "#212330" },
    -- Matching
    TelescopeMatching = { fg = "#f27a93" },
    -- Titles
    TelescopeTitle = { fg = "#A8A29E", bg = "none" },
    TelescopePromptTitle = { fg = "#A8A29E", bg = "none" },
    TelescopeResultsTitle = { fg = "#A8A29E", bg = "none" },
    TelescopePreviewTitle = { fg = "#121212", bg = "#0D9488" },
    -- Floaterm
    Floaterm = { bg = "none" },
    FloatermBorder = { fg = "#515678", bg = "none" },
    -- NvimTree
    NvimTreeNormal = { bg = "none" },
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
