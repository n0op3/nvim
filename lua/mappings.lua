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
map("n", "<C-n>", vim.cmd.bnext)
map("n", "<C-m>", vim.cmd.bprev)
map("n", "<leader>x", vim.cmd.bdelete)

-- Windows
map("n", "<M-h>", "<C-W><", { noremap = true })
map("n", "<M-j>", "<C-W>-", { noremap = true })
map("n", "<M-k>", "<C-W>+", { noremap = true })
map("n", "<M-l>", "<C-W>>", { noremap = true })
map("n", "<leader>v", "<C-W>v", { noremap = true })
map("n", "<leader>h", "<C-W>s", { noremap = true })

-- Search
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>b", telescope.buffers, { desc = "Telescope buffers" })
map("n", "<leader>gf", telescope.live_grep, { desc = "Find string" })
map("n", "<leader>gc", telescope.current_buffer_fuzzy_find, { desc = "Grep current buffer" })
map("n", "<leader>fb", function() telescope.buffers({ sort_lastused = true }) end, { desc = "Find buffers" })
map("n", "<leader>fm", telescope.marks, { desc = "Find marks" })
map("n", "<leader>fr", telescope.registers, { desc = "Find registers" })

-- LSP
map("n", "<leader>rx", telescope.lsp_references, { desc = "LSP references" })
map("n", "<leader>dx", telescope.diagnostics, { desc = "Telescope diagnostics" })
map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "Rename occurences" })
map("n", "<leader>ca", function() require("tiny-code-action").code_action() end, { desc = "Code actions" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "<leader>bf", "<CMD>ToggleFormatting<CR>", { desc = "Toggle LSP formatting for the current buffer" })
map("n", "<leader>cs", function() require("telescope").extensions.aerial.aerial() end, { desc = "Code symbols" })

-- Debugging
local dap = require("dap");
map("n", "<leader>dy", function() require("dapui").toggle() end, { desc = "Toggle DAP UI", nowait = true })
map("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint", nowait = true })
map("n", "<leader>dc", function() dap.continue() end, { desc = "Debugger continue", nowait = true })
map("n", "<leader>dl", function() dap.run_last() end, { desc = "Debug last run", nowait = true })
map("n", "<leader>dq", function() dap.terminate() end, { desc = "Terminate debugging", nowait = true })
map("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL", nowait = true })
map("n", "<leader>di", function() dap.step_into() end, { desc = "Step into", nowait = true })
map("n", "<leader>do", function() dap.step_over() end, { desc = "Step over", nowait = true })
map("n", "<leader>du", function() dap.step_out() end, { desc = "Step out", nowait = true })

-- Git
map("n", "<leader>gl", telescope.git_commits, { desc = "Git log" })
map("n", "<leader>gb", telescope.git_branches, { desc = "Git branches" })
map("n", "<leader>gs", telescope.git_status, { desc = "Git status" })

-- Misc
map("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
map("n", "<leader>st", telescope.colorscheme, { desc = "Switch colorscheme" })
map("n", "<esc>", vim.cmd.noh)
map("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Undo tree" })
map("n", "<leader>rs", "<CMD>colorscheme pywal16<CR>", { desc = "Pywal" })
