-- buffer switching
Map('n', '<Tab>', ':bnext<CR>', {noremap = true, silent = true})
Map('n', '<S-Tab>', ':bprev<CR>', {noremap = true, silent = true})

-- keep jumping
Map('n', '{', ':keepjumps normal! {<CR>', {noremap = true, silent = true})
Map('n', '}', ':keepjumps normal! }<CR>', {noremap = true, silent = true})

-- quickfix list navigation
Map('n', '<C-j>', ':cnext<CR>', { noremap = true, silent = true })
Map('n', '<C-k>', ':cprev<CR>', { noremap = true, silent = true })
Map('n', '<C-q>', ':call QuickFix_toggle()<CR>', { noremap = true, silent = true })

-- location list navigation
Map('n', '<leader>j', ':lnext<CR>', { noremap = true, silent = true })
Map('n', '<leader>k', ':lprev<CR>', { noremap = true, silent = true })
Map('n', '<leader>q', ':lopen<CR>', { noremap = true, silent = true })
