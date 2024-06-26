return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
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
                    'diagnostics'
                },
                lualine_c = {
                    'filename',
                    {
                        'g:coc_status',
                        icon = '',
                    }
                },
                lualine_x = { 'b:coc_current_function', 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            extensions = { 'nvim-tree' }
        })
    end
}
