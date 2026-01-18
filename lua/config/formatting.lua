vim.g.lsp_formatting_enabled = true

local function toggle_lsp_formatting()
    vim.g.lsp_formatting_enabled = not vim.g.lsp_formatting_enabled
    if vim.g.lsp_formatting_enabled then
        print("Formatting enabled")
    else
        print("Formatting disabled")
    end
end

vim.api.nvim_create_user_command("ToggleFormatting", toggle_lsp_formatting,
    { desc = "Toggle the automatic formatting" })

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        if vim.g.lsp_formatting_enabled then
            local clients = vim.lsp.get_active_clients({ bufnr = 0 })
            for _, client in ipairs(clients) do
                if client.server_capabilities.documentFormattingProvider then
                    vim.lsp.buf.format({ bufnr = 0 })
                    return
                end
            end
        end
    end
})
