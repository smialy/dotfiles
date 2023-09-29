local function is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
end

local telescope_find = function(name, opts)
    opts = opts or {}
    return function()
        local builtin = name
        if name == "files" then
            if is_git_repo() then
                opts.show_untracked = true
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
            { "<leader>ff", telescope_find("find_files"), desc = "Find Files (root dir)" },
            { "<leader>fg", telescope_find("git_files"), desc = "Grep (root dir)" },
            { "<leader>fb", telescope_find("buffers"), desc = "Buffers" },
            { "<leader>fr", telescope_find("resume"), desc = "Resume" },
            { "<leader>sw", telescope_find("grep_string"), desc = "Word (root dir)" },
            { "<leader>sg", telescope_find("live_grep"), desc = "Grep (root dir)" },
            { "<leader>/", telescope_find("live_grep"), desc = "Grep (root dir)" },
            { "<leader>fo", telescope_find("oldfiles"), desc = "Previously open files" },
        },
    },
}
