return {
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")
        end,
        keys = {
            { "]]", desc = "Next Reference" },
            { "[[", desc = "Prev Reference" },
        },
    },

    -- buffer remove
    {
        "echasnovski/mini.bufremove",
        keys = {
            { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdateSync" },
        opts = {
            ensure_installed = {
                "lua",
                "query",
                "bash",
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
