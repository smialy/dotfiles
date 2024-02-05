return {
    'chipsenkbeil/distant.nvim', 
    branch = 'v0.3',
    config = function()
        require('distant'):setup({
        client = {
         log_level = 'debug',
         log_file = "/home/smialy/.local/share/nvim/distant.log",
         bin = "/home/smialy/apps/distant",

            }
        })
    end
}
