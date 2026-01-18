local map = vim.keymap.set
vim.g.mapleader = " "

-- Core
map("n", "<leader>l", "<CMD>Lazy<CR>")
map("n", "<leader>m", "<CMD>Mason<CR>")
map("n", ";", ":")

-- Movement
map("n", "j", "gj")
map("n", "k", "gk")

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>dx", builtin.diagnostics, { desc = "Telescope diagnostics" })
map("n", "<leader>st", builtin.colorscheme, { desc = "Switch colorscheme" })
map("n", "<leader>gf", builtin.live_grep, { desc = "Find string" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>fm", builtin.buffers, { desc = "Find marks" })
map("n", "<leader>fr", builtin.buffers, { desc = "Find registers" })
map("n", "gd", builtin.lsp_references, { desc = "LSP references" })
map("n", "<leader>gl", builtin.git_commits, { desc = "Git log" })
map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

-- Misc
map("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
