return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = {}, -- Change the style of comments
                    conditionals = { "bold" },
                    loops = { "bold" },
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = { "bold" },
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                highlight_overrides = {
                    mocha = function(mocha)
                        return {
                            NvimTreeDiagnosticErrorIcon = { fg = mocha.red },
                            NvimTreeDiagnosticWarnIcon = { fg = mocha.yellow },
                            NvimTreeDiagnosticInfoIcon = { fg = mocha.sapphire },
                            NvimTreeDiagnosticHintIcon = { fg = mocha.teal },
                            CocNotificationWarning = { fg = mocha.yellow },
                            CocNotificationInfo = { fg = mocha.sapphire },
                            CocNotificationError = { fg = mocha.red },
                        }
                    end,
                },
                integrations = {
                    nvimtree = true,
                    coc_nvim = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "undercurl" },
                            hints = { "undercurl" },
                            warnings = { "undercurl" },
                            information = { "undercurl" },
                            ok = { "undercurl" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    telescope = {
                        enabled = true,
                        -- style = "nvchad"
                    },
                    treesitter = true,
                    indent_blankline = {
                        enabled = true,
                        scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                        colored_indent_levels = false,
                    },
                    notify = true,
                    dropbar = {
                        enabled = true,
                        color_mode = true, -- enable color for kind's texts, not just kind's icons
                    },
                }
            })
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
}
