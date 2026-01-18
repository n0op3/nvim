vim.api.nvim_create_autocmd({ "VimEnter" }, {
    nested = true,
    callback = function()
        vim.cmd.colorscheme(vim.g.SCHEME)
    end
})

vim.api.nvim_create_autocmd({ "Colorscheme" }, {
    callback = function(params)
        vim.g.SCHEME = params.match
    end
})
