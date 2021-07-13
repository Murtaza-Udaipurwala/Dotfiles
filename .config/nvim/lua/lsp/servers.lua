local lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_signature = require("lsp_signature")
local cfg = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated)
    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    fix_pos = true,  -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_prefix = "",  -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = false,  -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
        border = "none"   -- double, single, shadow, none
    },
}

-- clang
lsp.clangd.setup{
    capabilities = capabilities,
}


-- python
lsp.pylsp.setup{
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end,
}


-- html
lsp.html.setup {
    cmd = { "vscode-html-languageserver", "--stdio" },
    filetypes = { "html", "htmldjango" },
    capabilities = capabilities,
}


-- css
lsp.cssls.setup{
    cmd = { "css-languageserver", "--stdio" },
}


-- ts/js
lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end,
}


-- bash
lsp.bashls.setup{}


-- viml
lsp.vimls.setup{
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end
}


-- lua
local sumneko_root_path = "/usr/share/lua-language-server"
local sumneko_binary = "/usr/bin/lua-language-server"

lsp.sumneko_lua.setup {
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
    },
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end
}


-- dart
lsp.dartls.setup{
    cmd = { "dart", vim.fn.expand('$HOME') .. "/.local/builds/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
    init_options = {
        closingLabels = false,
        flutterOutline = false,
        onlyAnalyzeProjectsWithOpenFiles = false,
        outline = false,
        suggestFromUnimportedLibraries = true
    },
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end
}
