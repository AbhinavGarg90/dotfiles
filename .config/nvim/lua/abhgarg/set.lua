vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.wrap = false


vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = math.floor(vim.o.lines / 2)


-- Relative line numbers in file tree
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
vim.opt.listchars = { tab = ">>", trail = ".", nbsp = "␣" }
