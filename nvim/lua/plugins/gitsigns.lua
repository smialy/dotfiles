return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup({
                current_line_blame = true,
                on_attach = function(bufnr)
                    local function map(mode, lhs, rhs, opts)
                        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
                        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                    end
                    map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
                    map('v', '<leader>gs', ':Gitsigns stage_hunk<CR>')
                    map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
                    map('v', '<leader>gr', ':Gitsigns reset_hunk<CR>')
                    map('n', '<leader>gS', '<cmd>Gitsigns stage_buffer<CR>')
                    map('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>')
                    map('n', '<leader>gR', '<cmd>Gitsigns reset_buffer<CR>')
                    map('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
                    map('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
                    map('n', '<leader>gl', '<cmd>Gitsigns toggle_current_line_blame<CR>')
                    map('n', '<leader>gf', '<cmd>Gitsigns diffthis<CR>')
                    map('n', '<leader>gF', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
                    map('n', '<leader>hd', '<cmd>Gitsigns toggle_deleted<CR>')

                    -- Text object
                    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end

            });
        end,
    }
}
