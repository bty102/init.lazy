return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            extensions = {
                coc = {
                    theme = 'ivy',
                    prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
                    push_cursor_on_edit = true, -- save the cursor position to jump back in the future
                    timeout = 3000, -- timeout for coc commands
                }
            },
        })
        require('telescope').load_extension('coc')
        require("telescope").load_extension("notify")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<space><space>', builtin.find_files, {})
        vim.keymap.set('n', '<space>b', builtin.buffers, {})
        vim.keymap.set('n', '<F3>', "<cmd>Telescope coc<cr>")
    end
}
