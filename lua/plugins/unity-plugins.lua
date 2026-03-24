vim.lsp.enable({ "roslyn_ls" })

return {
    "apyra/nvim-unity-sync",
    lazy = false,
    config = function()
        require("unity.plugin").setup()
    end,
}
