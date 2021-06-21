-- window navigation
Map('n', '<C-h>', ':wincmd h<CR>', {noremap = true, silent = true})
Map('n', '<C-j>', ':wincmd j<CR>', {noremap = true, silent = true})
Map('n', '<C-k>', ':wincmd k<CR>', {noremap = true, silent = true})
Map('n', '<C-l>', ':wincmd l<CR>', {noremap = true, silent = true})

-- buffer switching
Map('n', '<Tab>', ':bnext<CR>', {noremap = true, silent = true})
Map('n', '<S-Tab>', ':bprev<CR>', {noremap = true, silent = true})

-- quickfix list navigation
Map('n', '<C-n>', ':cnext<CR>', { noremap = true, silent = true })
Map('n', '<C-p>', ':cprev<CR>', { noremap = true, silent = true })
Map('n', '<C-q>', ':copen<CR>', { noremap = true, silent = true })

-- location list navigation
Map('n', '<leader>n', ':lnext<CR>', { noremap = true, silent = true })
Map('n', '<leader>p', ':lprev<CR>', { noremap = true, silent = true })
Map('n', '<leader>q', ':lopen<CR>', { noremap = true, silent = true })
