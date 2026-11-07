local image_enabled = true

vim.keymap.set("n", "<leader>ti", function()
    local image = require("image")
    if image_enabled then
        image.clear()
        image.disable()
    else
        image.enable()
    end
    image_enabled = not image_enabled
    vim.notify("image.nvim " .. (image_enabled and "enabled" or "disabled"))
end, { desc = "Toggle image.nvim" }
)
