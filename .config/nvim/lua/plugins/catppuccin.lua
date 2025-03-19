return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup {
            flavour = "mocha",
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },
            integrations = {
                cmp = true,
                markdown = true,
                mason = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                snacks = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            }
    }
    vim.cmd.colorscheme "catppuccin"
    end,
}

