local map = vim.keymap.set
vim.g.mapleader = " "

map("n", ";", ":")
map("n", "j", "gj")
map("n", "k", "gk")
map("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
map("n", "<leader>l", "<CMD>Lazy<CR>")

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
