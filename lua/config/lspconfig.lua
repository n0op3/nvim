vim.api.nvim_create_user_command('RustSetAllFeatures', function()
    local clients = vim.lsp.get_clients({ name = 'rust_analyzer' })
    if #clients == 0 then
        print("No rust-analyzer client found. Open a Rust file first.")
        return
    end

    for _, client in ipairs(clients) do
        local settings = client.config.settings or {}
        client.config.settings = settings

        local ra = settings['rust-analyzer'] or {}
        settings['rust-analyzer'] = ra

        local cargo = ra.cargo or {}
        ra.cargo = cargo

        cargo.features = 'all'
        client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end

    print("rust-analyzer features set to 'all' for active clients.")
end, { desc = 'Enable all Rust features in rust-analyzer' })
