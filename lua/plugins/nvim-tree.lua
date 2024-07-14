return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
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
                    hint = "",
                    info = "󰋼",
                    warning = "󰀦",
                    error = "󰅙",
                },
            },
        }
        vim.keymap.set('n', '<F1>', "<cmd>NvimTreeToggle<cr>")
    end,
}
