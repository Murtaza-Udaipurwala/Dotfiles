local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- clang
require'lspconfig'.clangd.setup{
    capabilities = capabilities,
}


-- python
require'lspconfig'.jedi_language_server.setup{}


-- html
require'lspconfig'.html.setup {
    cmd = { "vscode-html-languageserver", "--stdio" }
}


-- css
require'lspconfig'.cssls.setup{}


-- ts/js
require'lspconfig'.tsserver.setup{}


-- bash
require'lspconfig'.bashls.setup{}


-- viml
require'lspconfig'.vimls.setup{}


-- lua
local sumneko_root_path = "/usr/share/lua-language-server"
local sumneko_binary = "/usr/bin/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',

                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}


-- dart
require'lspconfig'.dartls.setup{
    cmd = { "dart", vim.fn.expand('$HOME') .. "/.local/builds/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
    init_options = {
      closingLabels = false,
      flutterOutline = false,
      onlyAnalyzeProjectsWithOpenFiles = false,
      outline = false,
      suggestFromUnimportedLibraries = true
    },
}
