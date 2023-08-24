vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- useful tab mapping
vim.keymap.set("n", "<leader>te", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>to", vim.cmd.tabonly)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>tm", vim.cmd.tabmove)

vim.keymap.set({ "i", "v" }, "jk", "<ESC>", { remap = false, nowait = true })
vim.keymap.set("n", "<leader>w", vim.cmd.write))

