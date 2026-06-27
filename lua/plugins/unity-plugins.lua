local roslyn_dll = vim.fn.glob(
  vim.fn.expand('~/.dotnet/tools/.store/roslyn-language-server/*/roslyn-language-server.linux-x64/*/tools/net10.0/linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll'),
  false, true
)

local dotnet_bin = '/etc/profiles/per-user/' .. vim.env.USER .. '/bin/dotnet'
local dotnet_real = vim.uv.fs_realpath(dotnet_bin)

if #roslyn_dll > 0 and dotnet_real then
  local dotnet_root = vim.fn.fnamemodify(dotnet_real, ':h')
  vim.lsp.config.roslyn_ls = {
    cmd = { dotnet_real, roslyn_dll[1], '--stdio' },
    cmd_env = {
      DOTNET_ROOT = dotnet_root,
      DOTNET_ROOT_X64 = dotnet_root,
    },
  }
end

vim.lsp.enable({ "roslyn_ls" })

return {
    "apyra/nvim-unity-sync",
    lazy = false,
    config = function()
        require("unity.plugin").setup({
            unity_cs_template = true
        })
    end,
}
