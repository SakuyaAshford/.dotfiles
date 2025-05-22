return {
    {
        -- https://github.com/catppuccin/nvim
        'catppuccin/nvim',
        name = "catppuccin",
        opts = {
            flavour = "macchiato",
            transparent_background = true,
            integrations = {
                mini = true,
            },
        }, 
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
