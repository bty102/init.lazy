local builtin = require('telescope.builtin')

-- rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

-- code action selected
vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action)

-- format code selected(in visual mode) and format full buffer(in normal mode)
vim.keymap.set({'n', 'v'}, '<leader>f', vim.lsp.buf.format)

-- go to definition
vim.keymap.set('n', 'gd', builtin.lsp_definitions)

-- references
vim.keymap.set('n', 'gr', builtin.lsp_references)

-- diagnostics for current buffer
vim.keymap.set('n', '<leader>d',
    function ()
        builtin.diagnostics({bufnr=0})
    end)

-- document_symbols
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols)

-- show diagnostics at current cursor's position
vim.keymap.set('n', '<space>dc',
    function ()
        vim.diagnostic.open_float({scope='cursor'})
    end)
