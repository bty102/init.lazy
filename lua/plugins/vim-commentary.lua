return {
    "tpope/vim-commentary",
    config = function()
        vim.cmd("filetype plugin indent on")
        vim.cmd([[
            autocmd FileType c,cpp setlocal commentstring=//%s
        ]])
    end
}
