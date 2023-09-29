return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
            show_trailing_blankline_indent = true,
            show_current_context = true,
        },
    },
}
