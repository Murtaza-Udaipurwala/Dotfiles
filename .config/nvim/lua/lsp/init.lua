-----------------------------------------------------------------------------
-- LSP Diagnostics
-----------------------------------------------------------------------------
vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = " ", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = " ", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)

-----------------------------------------------------------------------------
-- symbols for autocomplete
-----------------------------------------------------------------------------
local lsp_symbols = {
    Class = "   (Class)",
    Color = "   (Color)",
    Constant = "   (Constant)",
    Constructor = "   (Constructor)",
    Enum = " 練 (Enum)",
    EnumMember = "   (EnumMember)",
    Field = " ﴲ  (Field)",
    File = "   (File)",
    Folder = "   (Folder)",
    Function = "   (Function)",
    Interface = " ﰮ  (Interface)",
    Keyword = "   (Keyword)",
    Method = "   (Method)",
    Module = "   (Module)",
    Property = " 襁 (Property)",
    Snippet = " ﬌  (Snippet)",
    Struct = " ﳤ  (Struct)",
    Text = "   (Text) ",
    Unit = "   (Unit)",
    Value = "   (Value)",
    Variable = "[] (Variable)",
    Reference = "   (Reference)",
    Event = " ﲀ  (Event)",
    Operator = "   (Operator)",
    TypeParameter = "   (TypeParameter)"
}

for kind, symbol in pairs(lsp_symbols) do
    local kinds = vim.lsp.protocol.CompletionItemKind
    local index = kinds[kind]

    if index ~= nil then
        kinds[index] = symbol
    end
end

vim.g.user_emmet_leader_key='<C-Z>'

require('lsp.compe')
require('lsp.servers')
