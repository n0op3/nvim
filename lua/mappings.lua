local map = vim.keymap.set
local telescope = require("telescope.builtin")
vim.g.mapleader = " "

-- Core
map("n", "<leader>l", "<CMD>Lazy<CR>")
map("n", "<leader>m", "<CMD>Mason<CR>")
map("n", ";", ":")

-- Movement
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<C-S-K>", vim.cmd.bnext)
map("n", "<C-S-J>", vim.cmd.bprev)
map("n", "<C-H>", "<C-W>h", { noremap = true })
map("n", "<C-J>", "<C-W>j", { noremap = true })
map("n", "<C-K>", "<C-W>k", { noremap = true })
map("n", "<C-L>", "<C-W>l", { noremap = true })
map("n", "<M-h>", "<C-W><", { noremap = true })
map("n", "<M-j>", "<C-W>-", { noremap = true })
map("n", "<M-k>", "<C-W>+", { noremap = true })
map("n", "<M-l>", "<C-W>>", { noremap = true })
map("n", "<leader>v", "<C-W>v", { noremap = true })
map("n", "<leader>h", "<C-W>s", { noremap = true })
map("n", "<leader>x", vim.cmd.bdelete)

-- Search
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
map("n", "<leader>gf", telescope.live_grep, { desc = "Find string" })
map("n", "<leader>fb", telescope.buffers, { desc = "Find buffers" })
map("n", "<leader>fm", telescope.marks, { desc = "Find marks" })
map("n", "<leader>fr", telescope.registers, { desc = "Find registers" })

-- LSP
map("n", "<leader>rx", telescope.lsp_references, { desc = "LSP references" })
map("n", "<leader>dx", telescope.diagnostics, { desc = "Telescope diagnostics" })
map("n", "<leader>ca", function() require("tiny-code-action").code_action() end, { desc = "Code actions" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

-- Git
map("n", "<leader>gl", telescope.git_commits, { desc = "Git log" })
map("n", "<leader>gb", telescope.git_branches, { desc = "Git branches" })
map("n", "<leader>gs", telescope.git_status, { desc = "Git status" })

-- Misc
map("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
map("n", "<leader>st", telescope.colorscheme, { desc = "Switch colorscheme" })
map("n", "<esc>", vim.cmd.noh)
