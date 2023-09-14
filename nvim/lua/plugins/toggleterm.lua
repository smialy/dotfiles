return {
    {
        'akinsho/toggleterm.nvim', 
        version = "*", 
        config = function(_, opts)
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "float",
                shade_terminals = false,
            })
        end
    }
}
