return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lsp_diagnostic_icons = require('lsp.icon').diagnostic
        require('lualine').setup({
            options = {
                globalstatus = true,
                component_separators = '',
                refresh = {
                    statusline = 300,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    {
                        'branch',
                        icon = ''
                    },
                    'diff',
                    {
                        'diagnostics',
                        symbols = {
                            error = lsp_diagnostic_icons.Error,
                            warn = lsp_diagnostic_icons.Warn,
                            info = lsp_diagnostic_icons.Info,
                            hint = lsp_diagnostic_icons.Hint
                        },
                    }
                },
                lualine_c = { 'filename' },
                lualine_x = {
                    -- {
                    --     require("noice").api.status.message.get_hl,
                    --     cond = require("noice").api.status.message.has,
                    -- },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                        color = { fg = "#ff9e64" },
                        icon = {'󰘳', align='right'},
                    },
                    -- {
                    --     require("noice").api.status.mode.get,
                    --     cond = require("noice").api.status.mode.has,
                    --     color = { fg = "#ff9e64" },
                    -- },
                    -- {
                    --     require("noice").api.status.search.get,
                    --     cond = require("noice").api.status.search.has,
                    --     color = { fg = "#ff9e64" },
                    -- },
                    'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            extensions = { 'nvim-tree' }
        })
    end
}
