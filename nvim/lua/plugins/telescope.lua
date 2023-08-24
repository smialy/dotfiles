local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
end

local telescope_find = function(name, opts)
    return function() 
        local builtin = name 
        if name == "files" then
            if is_git_repo() then
                builtin = "git_files"
            else
                builtin = "find_files"
            end
        elseif name == "grep" then
            builtin = "grep_string"
        end
        local fn = require("telescope.builtin")[builtin]
        fn(opts)
    end
end

return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { "<leader>:", telescope_find("command_history"), desc = "Command history" },
            { "<leader><space>", telescope_find("files"), desc = "Find Files (root dir)" },
            { "<leader>ff", telescope_find("files"), desc = "Find Files (root dir)" },
            { "<leader>fb", telescope_find("buffers"), desc = "Buffers" },
            { "<leader>/", telescope_find("grep"), desc = "Grep (root dir)" },
            { "<leader>fw", telescope_find("grep"), desc = "Grep (root dir)" },
            { "<leader>fg", telescope_find("live_grep"), desc = "Grep (root dir)" },
            { "<leader>fo", telescope_find("oldfiles"), desc = "Previously open files" },
            { "<leader>fc", telescope_find("git_commits"), desc = "Git commits" },
            { "<leader>fs", telescope_find("git_status"), desc = "Git Status" },
            { "<leader>ft", telescope_find("treesitter"), desc = "Find in Treesitter" },
        }
    },
}
