local define_icons = {
    diagnostic = { Error = "󰅙 ", Warn = "󰀦 ", Hint = "󱉔 ", Info = "󰋼 " },
    kind = {
        Text = "",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "󰅩",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }
}
-------------------------------------------------------------------------
-- Change diagnostic symbols in the sign column (gutter)
local signs = define_icons.diagnostic
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
---------------------------------------------------------------------
return define_icons
