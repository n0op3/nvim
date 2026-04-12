return {
    "uga-rosa/ccc.nvim",
    config = function()
        require("ccc").setup({
            highligher = {
                auto_enable = true,
                lsp = true
            }
        })
    end
}
