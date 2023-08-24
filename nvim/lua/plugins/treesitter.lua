return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdateSync" },
        opts = {
            ensure_installed = {
                "lua",
                "query",
                "python",
                "javascript",
                "typescript",
                "tsx",
                "json",
            },
            sync_install = false,
            auto_install = true,
            ignore_install = {}, -- List of parsers to ignore installing
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = {}, -- list of language that will be disabled
            },
        }
    }
}
