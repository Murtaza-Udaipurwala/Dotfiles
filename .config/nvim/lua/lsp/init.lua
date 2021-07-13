local map = vim.api.nvim_set_keymap

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true})
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
map('n', '<leader>ir', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
-- map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})
-- map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true, silent = true})
-- map('n', '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {noremap = true, silent = true})
-- map('n', '<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', {noremap = true, silent = true})
-- map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', {noremap = true, silent = true})
-- map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', {noremap = true, silent = true})

vim.g.user_emmet_leader_key='<C-Z>'
vim.g.vsnip_snippet_dir = '$HOME/.config/nvim/snippets'

require('lsp.aesthetics')
require('lsp.servers')
