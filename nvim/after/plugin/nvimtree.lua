-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup()
local api = require("nvim-tree.api")
vim.keymap.set('n', '<leader>n', function() api.tree.toggle({ focus = true, find_file = true }) end)
vim.keymap.set('n', '<leader>ff', vim.cmd.NvimTreeFocus)
vim.keymap.set('n', '<leader>fs', vim.cmd.NvimTreeFindFile)
