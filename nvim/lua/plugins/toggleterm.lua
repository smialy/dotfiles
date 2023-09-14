return {
    {
        'akinsho/toggleterm.nvim', 
        version = "*", 
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "float",
                shade_terminals = false,
            })
            local opts = {}
            vim.keymap.set('t', '<A-k>', '<Up>', opts)
            vim.keymap.set('t', '<A-j>', '<Down>', opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end
    }
}
