local map = vim.keymap.set
vim.g.mapleader = " "

map("n", ";", ":")
map("n", "j", "gj")
map("n", "k", "gk")
map("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
map("n", "<leader>l", "<CMD>Lazy<CR>")
