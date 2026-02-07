require("mappings")

vim.notify = require("notify")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars:append({ eob = " " })

vim.opt.guicursor = "n-v-c:block"
vim.opt.background = "dark"
vim.opt.winborder = "single"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.colorcolumn = '90'
vim.opt.wrap = false

vim.opt.undofile = true

vim.opt.foldlevel = 99
vim.opt.foldenable = true

vim.opt.conceallevel = 2

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "⚠",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "ERROR", linehl = "", numhl = "" })
