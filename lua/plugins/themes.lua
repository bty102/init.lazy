return {
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_visual = 'reverse'
            vim.g.gruvbox_material_diagnostic_text_highlight = true
            vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'
            vim.cmd.colorscheme('gruvbox-material')
        end
    },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        priority = 1000,
        config = function ()
            require("catppuccin").setup({
                show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
                integrations = {
                    nvimtree = true,
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
                    cmp = true,
                    noice = true,
                    notify = true,
                    treesitter = true,
                    telescope = {
                        enabled = true,
                        style = "nvchad"
                    },
                    indent_blankline = {
                        enabled = true,
                        scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                        colored_indent_levels = false,
                    },
                    dropbar = {
                        enabled = true,
                        color_mode = true, -- enable color for kind's texts, not just kind's icons
                    },
                }
            })
            vim.cmd.colorscheme "catppuccin"
        end
    }
}
