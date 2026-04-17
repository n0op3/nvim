return {
    "3rd/image.nvim",
    opts = {
        backend = "kitty",
        processor = "magick_cli",
        integrations = {
            markdown = {
                enabled = true,
                filetypes = { "markdown", "vimwiki" },
            },
        },
        window_overlap_clear_enabled = true,
    },
}
