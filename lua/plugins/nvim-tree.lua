return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local lsp_diagnostic_icons = require('lsp.icon').diagnostic
        require("nvim-tree").setup {
            renderer = {
                highlight_git = "name",
                highlight_diagnostics = "name",
                indent_markers = {
                    enable = true,
                },
            },
            update_focused_file = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                icons = {
                    hint = lsp_diagnostic_icons.Hint,
                    info = lsp_diagnostic_icons.Info,
                    warning = lsp_diagnostic_icons.Warn,
                    error = lsp_diagnostic_icons.Error,
                },
            },
        }
        vim.keymap.set('n', '<F1>', "<cmd>NvimTreeToggle<cr>")
    end,
}
