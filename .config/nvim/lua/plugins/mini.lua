return {
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        opts = {
            mappings = {
                add = '<leader>sa', -- Add surrounding in Normal and Visual modes
                delete = '<leader>sd', -- Delete surrounding
                find = '<leader>sf', -- Find surrounding (to the right)
                find_left = '<leader>sF', -- Find surrounding (to the left)
                highlight = '<leader>sh', -- Highlight surrounding
                replace = '<leader>sr', -- Replace surrounding
                update_n_lines = '<leader>sn', -- Update `n_lines`

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            },
        }
    },
}



