require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        -- disable = { "c", "rust" },  -- list of language that will be disabled
    },
    context_commentstring = {enable = true, config = {css = '// %s'}},
    autopairs = {enable = true},
    indent = {enable = {
        "javascriptreact",
        "python"
    }},
    autotag = {enable = true},
}
