return {
    "rachartier/tiny-code-action.nvim",
    event = "LspAttach",
    opts = {
        picker = {
            "buffer",
            opts = {
                hotkeys = true,
                hotkeys_mode = "text_diff_based",
                auto_preview = false,
                auto_accept = true,
                position = "cursor",
                keymaps = {
                    preview = "K", close = { "q", "<Esc>" }, select = "<CR>", preview_close = { "q", "<Esc>" }, },
                custom_keys = {
                    { key = 'm', pattern = 'Fill match arms' },
                    { key = 'r', pattern = 'Rename.*' }, },
                group_icon = " └",
            },
        },
    }
}
