return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdate" },
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
            highlight = {
                enable = true,
                disable = {},
            },
            indent = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                lsp_interop = {
                    enable = true,
                    border = "none",
                    peek_definition_code = {
                        ["<leader>df"] = "@function.outer",
                        ["<leader>dF"] = "@class.outer",
                    },
                },
            },
            --> moving between textobjext <--
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]]"] = "@function.outer",
                    ["]m"] = "@class.outer",
                },
                goto_next_end = {
                    ["]["] = "@function.outer",
                    ["]M"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer",
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                    ["[M"] = "@class.outer",
                },
            },
            refactor = {
                smart_rename = {
                    enable = true,
                    keymaps = {
                        rmart_rename = "grr",
                    },
                },
            },
        }

    },
    {
        {
            "nvim-treesitter/nvim-treesitter-context",
            enabled = true,
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            enabled = true,
        },
        {
            "nvim-treesitter/nvim-treesitter-refactor",
            enabled = true,
        }
    }
}
