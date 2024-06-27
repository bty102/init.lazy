local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    require('plugins.themes'),
    require('plugins.nvim-tree'),
    require('plugins.coc'),
    require('plugins.lualine'),
    require('plugins.telescope'),
    require('plugins.telescope-coc'),
    require('plugins.vim-snippets'),
}

local config = {
    checker = {
        enabled = true,
    }
}

require("lazy").setup(plugins, config)
