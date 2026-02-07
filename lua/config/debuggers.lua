local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
    }
}

dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
            local input = vim.fn.input("Program arguments: ", "", "file")
            if input == "" then return {} end
            local args = {}
            for word in input:gmatch("%S+") do
                table.insert(args, word)
            end
            return args
        end
    },
}

dap.configurations.cpp = dap.configurations.c
