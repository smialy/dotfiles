return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        keys = {
            {
                "<leader>o",
                function()
                    require("nvim-tree.api").tree.toggle({ focus = true, find_file = true })
                end,
                mode = "n",
                silent = true,
                desc = "toggle tree",
            },
        },
        init = function()
            local autocmd = vim.api.nvim_create_autocmd

            autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
                pattern = "NvimTree_*",
                callback = function()
                    local layout = vim.api.nvim_call_function("winlayout", {})
                    if
                        layout[1] == "leaf"
                        and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
                        and layout[3] == nil
                    then
                        --vim.cmd("confirm quit")
                    end
                end,
            })

            -- when no file/directory is opened at startup
            -- skip nvim-tree so that dashboard can load
            local cmdline_args = -1
            if vim.fn.argc(cmdline_args) == 0 then
                return
            else
                autocmd({ "VimEnter" }, {
                    -- open nvim-tree for noname buffers and directory
                    callback = function(args)
                        -- buffer is a [No Name]
                        local no_name = args.file == "" and vim.bo[args.buf].buftype == ""
                        -- buffer is a directory
                        local directory = vim.fn.isdirectory(args.file) == 1

                        if not directory and not no_name then
                            return
                        end

                        local api = require("nvim-tree.api")

                        if directory then
                            -- change to the directory
                            vim.cmd.cd(args.file)
                            -- open the tree
                            api.tree.open()
                        else
                            -- open the tree, find the file but don't focus it
                            api.tree.toggle({ focus = false, find_file = true })
                        end
                    end,
                })
            end
        end,
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end,
        opts = function(_, _)
            return {
                disable_netrw = true,
                hijack_netrw = true,
                hijack_unnamed_buffer_when_opening = true,
                hijack_cursor = true,
                sync_root_with_cwd = false,
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
                git = {
                    enable = true,
                    ignore = true,
                },
                modified = {
                    enable = true,
                },
                -- window / buffer setup
                view = {
                    width = 40,
                    preserve_window_proportions = true,
                },
                renderer = {
                    group_empty = true,
                    root_folder_label = true,
                    highlight_opened_files = "icon",
                    highlight_modified = "icon",
                    symlink_destination = true,
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    show_on_open_dirs = true,
                    debounce_delay = 50,
                    severity = {
                        min = vim.diagnostic.severity.INFO,
                        max = vim.diagnostic.severity.ERROR,
                    },
                },
                tab = {
                    sync = {
                        open = true,
                        close = true,
                    },
                },
            }
        end,
    },
}

