return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        {
            "<leader>ef",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
        {
            "<leader>ee",
            "<cmd>Yazi cwd<cr>",
            desc = "Open the file manager in nvim's working directory",
        },
        {
            "<c-up>",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
    ---@type YaziConfig | {}
    opts = {
        open_for_directories = true,
        keymaps = {
            show_help = "<f1>",
            open_file_in_vertical_split = "<>",
        },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
