return {
    {
        'nvim-lualine/lualine.nvim',
        enabled = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = "VeryLazy",
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '|',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    }
                },
            },
        },
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
    },
}
