return {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "rafamadriz/friendly-snippets",
        {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-path",
    },
    config = function()
        local luasnip = require("luasnip")
        local lspkind = require('lspkind')
        local lsp_kind_icons = require('lsp.icon').kind
        -- Set up nvim-cmp.
        local cmp = require 'cmp'

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                { name = 'buffer' },
                { name = 'path' },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text', -- show only symbol annotations
                    symbol_map = {
                        Text = lsp_kind_icons.Text,
                        Method = lsp_kind_icons.Method,
                        Function = lsp_kind_icons.Function,
                        Constructor = lsp_kind_icons.Constructor,
                        Field = lsp_kind_icons.Field,
                        Variable = lsp_kind_icons.Variable,
                        Class = lsp_kind_icons.Class,
                        Interface = lsp_kind_icons.Interface,
                        Module = lsp_kind_icons.Module,
                        Property = lsp_kind_icons.Property,
                        Unit = lsp_kind_icons.Unit,
                        Value = lsp_kind_icons.Value,
                        Enum = lsp_kind_icons.Enum,
                        Keyword = lsp_kind_icons.Keyword,
                        Snippet = lsp_kind_icons.Snippet,
                        Color = lsp_kind_icons.Color,
                        File = lsp_kind_icons.File,
                        Reference = lsp_kind_icons.Reference,
                        Folder = lsp_kind_icons.Folder,
                        EnumMember = lsp_kind_icons.EnumMember,
                        Constant = lsp_kind_icons.Constant,
                        Struct = lsp_kind_icons.Struct,
                        Event = lsp_kind_icons.Event,
                        Operator = lsp_kind_icons.Operator,
                        TypeParameter = lsp_kind_icons.TypeParameter,
                    },
                    maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- can also be a function to dynamically calculate max width such as
                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        return vim_item
                    end
                })
            }
        })
    end,
}
