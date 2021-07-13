vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_first_indent_level = false

vim.g.indent_blankline_filetype = {
    'python',
}

vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "^if",
    "while",
    "for",
    "with",
    "func_literal",
    "block",
    "try",
    "except",
    "argument_list",
    "object",
    "dictionary"
}

vim.g.indent_blankline_filetype_exclude = {
    "help",
    "vimwiki",
    "man",
    "git",
    "packer",
    "markdown",
    "lspinfo",
}
