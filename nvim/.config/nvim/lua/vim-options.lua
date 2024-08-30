vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

vim.opt.spelllang = "en_gb"
vim.opt.spell = true
vim.opt.guifont= "SauceCodePro NF SemiBold"
vim.opt.virtualedit="block"
vim.wo.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })



vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
