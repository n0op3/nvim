local dap = require("dap")

local dapui = require("dapui")

dap.adapters.lldb = {
    type = 'executable',
    command = '/sbin/codelldb',
    name = 'lldb',
}

dap.configurations.rust = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require('nvim-dap-virtual-text').setup()

require('rust-tools').setup({
    tools = {
        autoSetHints = true,
        inlay_hints = {
            auto = true,
            show_parameter_hints = true,
        },
    },
    server = {
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = true,
            },
        },
    },
    dap = {
        adapter = require('dap').adapters.lldb,
    },
})
