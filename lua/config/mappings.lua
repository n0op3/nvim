local map = vim.keymap.set
local wk = require("which-key")

map("n", ";", ":")
map("n", "j", "gj")
map("n", "k", "gk")
map("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
map("n", "<leader>x", vim.cmd.bdelete)
map("n", "<tab>", vim.cmd.bnext)
map("n", "<S-tab>", vim.cmd.bprev)
map("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
map("n", "<leader>m", "<CMD>Mason<CR>", { desc = "Open Mason" })
map("n", "<leader>cp", "<CMD>PickColor<CR>", { desc = "Color picker" })
map("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
map("n", "<leader>bf", "<CMD>ToggleFormatting<CR>", { desc = "Toggle LSP formatting for the current buffer" })

-- View
map("n", "<leader>Z", function() Snacks.zen() end, { desc = "Toggle zen mode" })
map("n", "<leader>z", function() Snacks.zen.zoom() end, { desc = "Toggle zoom" })
map("n", "<leader>n", "<CMD>set nu!<CR>", { desc = "Toggle line numbers" })
map("n", "<leader>rn", "<CMD>set rnu!<CR>", { desc = "Toggle relative line numbers" })
map("n", "<leader>v", "<CMD>vsplit<CR>", { desc = "Create a vertical split" })
map("n", "<leader>h", "<CMD>split<CR>", { desc = "Create a horizontal split" })

-- Resizing windows
map("n", "<M-h>", "<C-w><", { desc = "Decrease size right" })
map("n", "<M-j>", "<C-w>-", { desc = "Decrease size up" })
map("n", "<M-k>", "<C-w>+", { desc = "Increase size up" })
map("n", "<M-l>", "<C-w>>", { desc = "Incrase size right" })

-- Buffer swtiching
map("n", "<M-1>", "<CMD>BufferGoto 1<CR>", { desc = "Go to buffer 1", noremap = true })
map("n", "<M-2>", "<CMD>BufferGoto 2<CR>", { desc = "Go to buffer 2", noremap = true })
map("n", "<M-3>", "<CMD>BufferGoto 3<CR>", { desc = "Go to buffer 3", noremap = true })
map("n", "<M-4>", "<CMD>BufferGoto 4<CR>", { desc = "Go to buffer 4", noremap = true })
map("n", "<M-5>", "<CMD>BufferGoto 5<CR>", { desc = "Go to buffer 5", noremap = true })
map("n", "<M-6>", "<CMD>BufferGoto 6<CR>", { desc = "Go to buffer 6", noremap = true })
map("n", "<M-7>", "<CMD>BufferGoto 7<CR>", { desc = "Go to buffer 7", noremap = true })
map("n", "<M-8>", "<CMD>BufferGoto 8<CR>", { desc = "Go to buffer 8", noremap = true })
map("n", "<M-9>", "<CMD>BufferGoto 9<CR>", { desc = "Go to buffer 9", noremap = true })
map("n", "<M-0>", "<CMD>BufferGoto 10<CR>", { desc = "Go to buffer 10", noremap = true })

-- LSP actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>cx", "<CMD>ContextToggle<CR>", { desc = "Toggle context" })
map("n", "<leader>cs", function() require("aerial").snacks_picker() end, { desc = "Search symbols" })
map("n", "<leader>cu", function() Snacks.picker.lsp_references() end, { desc = "Find usages" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>rf", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
map("n", "<leader>ra", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
map("n", "<leader>gi", "<CMD>Generate implementations<CR>", { desc = "Generate C/C++ implementations" })
map("n", "<leader>gh", "<CMD>ClangdSwitchSourceHeader<CR>", { desc = "Go to header/implementation" })

-- Debugging
map("n", "<F9>", function() require("dap").continue() end)
map("n", "<F10>", function() require("dap").step_over() end)
map("n", "<F11>", function() require("dap").step_into() end)
map("n", "<F12>", function() require("dap").step_out() end)
map("n", "<leader>b", function() require("dap").toggle_breakpoint() end)

-- Pywal
map("n", "<leader>rs", function()
        require("lualine").setup {
            options = {
                theme = "pywal"
            }
        }
        require("pywal16").setup()
    end,
    { desc = "Set theme to pywal" })

-- Find
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Search buffers" })
map("n", "<leader>fc", function() Snacks.picker.command_history() end, { desc = "Show commands history" })
map("n", "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, { desc = "Search files" })
map("n", "<leader>fj", function() Snacks.picker.jumps() end, { desc = "Search jumps" })

-- Git
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git log" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git diff" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git status" })
map("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git branches" })

-- Notifications
map("n", "<leader>fn", function() Snacks.notifier.show_history() end, { desc = "Show notification history" })
map("n", "<leader>dn", function() Snacks.notifier.hide() end, { desc = "Dismiss all notifications" })

-- Explorer
map("n", "<leader>e", "<CMD>Neotree toggle=true<CR>", { desc = "Toggle file explorer" })

-- Grep
map("n", "<leader>gf", function() Snacks.picker.grep() end, { desc = "Grep all files" })
map("n", "<leader>gc", function() Snacks.picker.lines() end, { desc = "Grep the current buffer" })
map("n", "<leader>ga", function() Snacks.picker.grep_buffers() end, { desc = "Grep all buffers" })

-- Colorscheme picker
map("n", "<leader>st", function()
    Snacks.picker.colorschemes()
    require("lualine").setup {
        options = {
            theme = "auto"
        }
    }
end, { desc = "Switch the color scheme" })

-- Diagnostics
map("n", "<leader>dx", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })

-- Silicon
wk.add({
    mode = { "v" },
    { "<leader>s",  group = "Silicon" },
    { "<leader>sc", function() require("nvim-silicon").clip() end,  desc = "Copy code screenshot to clipboard" },
    { "<leader>sf", function() require("nvim-silicon").file() end,  desc = "Save code screenshot as file" },
    { "<leader>ss", function() require("nvim-silicon").shoot() end, desc = "Create code screenshot" },
})
