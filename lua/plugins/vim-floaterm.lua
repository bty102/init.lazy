return {
    "voldikss/vim-floaterm",
    config = function()
        vim.g.floaterm_shell = "pwsh"
        vim.g.floaterm_title = " TERMINAL [$1/$2]"
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_titleposition = 'center'

        vim.cmd([[
            nnoremap   <silent>   <F7>    :FloatermNew<CR>
            tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
            nnoremap   <silent>   <F8>    :FloatermPrev<CR>
            tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
            nnoremap   <silent>   <F9>    :FloatermNext<CR>
            tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
            nnoremap   <silent>   <F12>   :FloatermToggle<CR>
            tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
        ]])
    end
}
