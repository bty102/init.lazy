vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"},{
	pattern = {"*.lua", "*.c", "*.cpp", "*.cc", "*.h", "*.java", "*.json"},
	command = "set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent",
})
