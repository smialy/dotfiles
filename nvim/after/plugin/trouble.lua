local api = require("trouble")
api.setup {
    icons = false,
}
vim.keymap.set("n", "<leader>xx", function() api.open() end)
