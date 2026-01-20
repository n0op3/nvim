return {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    opts = {},
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    border = vim.g.border
                }
            }
        },
        "neovim/nvim-lspconfig",
    },
}
