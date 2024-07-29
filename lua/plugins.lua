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
    require('plugins.lualine'),
    require('plugins.telescope'),
    require('plugins.bufferline'),
    require('plugins.nvim-treesitter'),
    require('plugins.indent-blankline'),
    require('plugins.vim-floaterm'),
    require('plugins.vim-commentary'),
    require('plugins.dropbar'),
    require('plugins.nvim-lspconfig'),
    require('plugins.nvim-cmp'),
    require('plugins.lazydev'),
    require('plugins.lspkind'),
    require('plugins.noice'),
    require('plugins.dressing'),
    require('plugins.clangd_extensions'),
    require('plugins.nvim-jdtls'),
    require('plugins.mini-pairs'),
}

local config = {
    checker = {
        enabled = true,
    }
}

require("lazy").setup(plugins, config)
