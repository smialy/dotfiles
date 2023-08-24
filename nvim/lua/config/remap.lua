local set = vim.keymap.set

vim.g.mapleader = " "
set("n", "<leader>ex", vim.cmd.Ex)

-- tab mapping
set("n", "<leader>te", vim.cmd.tabnew)
set("n", "<leader>tn", vim.cmd.tabnext)
set("n", "<leader>tp", vim.cmd.tabprev)
set("n", "<leader>to", vim.cmd.tabonly)
set("n", "<leader>tc", vim.cmd.tabclose)
set("n", "<leader>tm", vim.cmd.tabmove)

set("n", "<leader>w", vim.cmd.write)
set("n", "<leader>l", ":set relativenumber!<CR>")

set({"n", "i", "v", "c"}, "<C-c>", "<Esc>")
set({ "i", "v" }, "jk", "<ESC>", { remap = false, nowait = true })

-- Split
set("n", "<leader>v", ":vsp<CR>")
set("n", "<leader>h", ":sp<CR>")

-- window resize
set("n", "<S-up>", ":resize -5<CR>")
set("n", "<S-down>", ":resize +5<CR>")

-- jump
set("n", "J", "5j")
set("n", "K", "5k")

-- move lines
set("n", "<A-j>", ":m .+1<CR>")
set("n", "<A-k>", ":m .-2<CR>")
set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
set("v", "<A-j>", ":m '>+1<CR>gv=gv")
set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- ctrl+q to quit
set("n", "<C-q>", ":q<CR>")
