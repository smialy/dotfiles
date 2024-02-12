return {
    {
        "mhartington/formatter.nvim",
        lazy = false,
        keys = {
            { "<leader>z", ":Format<CR>"}
        },
        opts = function()
            return {
                logging = true,
                log_level = vim.log.levels.DEBUG,
                filetype = {
                    python = {
                        require("formatter.filetypes.python").ruff,
                    },
                    ["*"] = {
                        -- "formatter.filetypes.any" defines default configurations for any
                        -- filetype
                        require("formatter.filetypes.any").remove_trailing_whitespace
                    }
                }
            }
        end
    },
}
