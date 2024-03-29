-- vim.g.netrw_browse_split = 4 -- Open in previous window
-- vim.g.netrw_altv = 1 -- Open with right splitting
-- vim.g.netrw_liststyle = 3 -- Tree-style view
-- vim.g.undotree_SetFocusWhenToggle = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

vim.g.copilot_assume_mapped = true 
