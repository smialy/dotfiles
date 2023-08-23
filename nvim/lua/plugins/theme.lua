return {
    {
        "navarasu/onedark.nvim",
        -- event = {"BufReadPre","BufNewFile"},
        config = function(_, opts)
            require("onedark").setup(opts)
            require("onedark").load()
        end,
        opts = {
            style = "warm", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false, -- Show/hide background
        }
    }
}

