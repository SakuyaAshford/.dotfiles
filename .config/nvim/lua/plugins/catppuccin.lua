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
     }
     vim.cmd.colorscheme "catppuccin"
     end,
}
