return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional dependencies
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<C-x>"] = "delete_buffer"
                    }
                }
            }
        }
    }
}
