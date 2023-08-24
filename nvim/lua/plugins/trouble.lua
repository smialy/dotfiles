return {
    {
        "folke/trouble.nvim",
        opts = {
              icons = false,
         },
        config = function(_, opts)
            print(opts)
            require("trouble").setup(opts)
        end,
     keys = {
           { "<leader>xx", ":TroubleToggle<CR>" },
           { "<leader>xq", ":TroubleToggle quickfix<CR>" },
           { "<leader>xd", ":TroubleToggle document_diagnostics<CR>" },
        },
    }
}
