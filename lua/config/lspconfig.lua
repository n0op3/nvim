-- On Nix, clangd queries `clang` for system includes, but that clang has no
-- libstdc++ paths (and clangd's bundled `clang-tool` is missing). Hand it GCC's
-- include dirs through the standard env vars so <iostream>/<vector> etc. and
-- std:: completions work even without a compile_commands.json.
local function clangd_include_env()
    if vim.fn.executable("g++") ~= 1 then
        return {}
    end

    local lines = vim.fn.systemlist("g++ -E -x c++ -v /dev/null 2>&1")
    local includes = {}
    local collecting = false
    for _, line in ipairs(lines) do
        if line:match("search starts here:") then
            collecting = true
        elseif line:match("End of search list") then
            break
        elseif collecting and line:match("^%s+/") then
            table.insert(includes, vim.trim(line))
        end
    end

    if #includes == 0 then
        return {}
    end

    return {
        CPLUS_INCLUDE_PATH = table.concat(includes, ":"),
    }
end

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--query-driver=/nix/store/*/bin/*,/run/current-system/sw/bin/*,/etc/profiles/per-user/*/bin/*",
        "--background-index",
        "--clang-tidy"
    },
    cmd_env = clangd_include_env(),
})
vim.lsp.enable("clangd")
vim.lsp.enable("gdscript")

vim.api.nvim_create_user_command('RustSetAllFeatures', function()
    local clients = vim.lsp.get_clients({ name = 'rust-analyzer' })
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

        cargo.allFeatures = true
        client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end

    print("rust-analyzer features set to 'all' for active clients.")
end, { desc = 'Enable all Rust features in rust-analyzer' }
)
