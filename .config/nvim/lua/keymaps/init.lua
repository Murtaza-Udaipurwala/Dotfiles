Map = vim.api.nvim_set_keymap

-- leader key
Map('n', '<Space>', '<NOP>', {noremap = true})
vim.g.mapleader = ' '

Map('n', 'Y', 'y$', { noremap = true })
Map('v', '<leader>d', '"_dP', {noremap = true})
Map('n', '<leader>c', ':<up><CR>', {noremap = true}) -- Run the last command
Map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
Map('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- window resize
Map('n', '<C-Up>', ':resize -2<CR>', {noremap = true, silent = true})
Map('n', '<C-Down>', ':resize +2<CR>', {noremap = true, silent = true})
Map('n', '<C-Left>', ':vertical resize -2<CR>', {noremap = true, silent = true})
Map('n', '<C-Right>', ':vertical resize +2<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
Map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
Map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better tabbing
Map('v', '<', '<gv', {noremap = true})
Map('v', '>', '>gv', {noremap = true})

-- netrw
Map('n', '<C-e>', ':Vexplore<CR>', { noremap = true, silent = true })

-- terminal
Map('n', '<leader>t', ':term', {noremap = true, silent = true})
Map('t', '<esc>', '<C-\\><C-n>', {noremap = true})

-- nvim-comment
Map('n', '<leader>/', ':CommentToggle<CR>', {noremap = true, silent = true})
Map('v', '<leader>/', ':CommentToggle<CR>', {noremap = true, silent = true})

require('keymaps.navigation')
require('keymaps.telescope')
require('keymaps.lsp')
