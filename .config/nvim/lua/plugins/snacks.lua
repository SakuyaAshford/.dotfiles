return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts =  {
        --  your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section   below
        dashboard = {
            sections = {
                { section = "header" },
                {
                  pane = 2,
                  section = "terminal",
                  cmd = "colorscript -e square",
                  height = 5,
                  padding = 1,
                },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                  pane = 2,
                  icon = " ",
                  title = "Git Status",
                  section = "terminal",
                  enabled = function()
                    return Snacks.git.get_root() ~= nil
                  end,
                  cmd = "git status --short --branch --renames",
                  height = 5,
                  padding = 1,
                  ttl = 5 * 60,
                  indent = 3,
                },
                { section = "startup" },
            },
        },
        explorer = {
            enabled = true,
            replace_netrw = true,
            mapping = {
                n = {
                    ["<CR>"] = "edit",
                },
            },
        },
        notifier = { enabled = true },
        picker = { enabled = true},
        terminal = { enabled = true },
        toggle = { enabled = true },
        zen = { enabled = true }
    },
    keys = {
        -- Explorer 
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        -- Notified
        { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        -- Picker
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },

        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- Terminal
        { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
        -- Zen
        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    }
}
