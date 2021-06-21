vim.cmd("filetype plugin indent on")

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.updatetime = 300
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.scrolloff = 7
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.mouse = "a"
vim.o.backup = false
vim.o.writebackup = false
vim.o.pumheight = 10
vim.o.cmdheight = 1
vim.o.showmode = false
vim.o.timeoutlen = 500
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.termguicolors = true
vim.o.smarttab = true
vim.o.background = "dark"
vim.o.inccommand = "nosplit"
vim.o.laststatus = 2
-- vim.o.guicursor = "i:block"

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true

vim.bo.swapfile = false
