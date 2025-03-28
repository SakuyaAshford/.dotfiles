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
        notifier = { enabled = true },
        terminal = { enabled = true },
        toggle = { enabled = true },
        zen = { enabled = true }
    },
    keys = {
        -- Notified
        { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        -- Terminal
        { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
        -- Zen
        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    }
}
