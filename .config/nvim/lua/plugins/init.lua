local M = {}

function M.setup()


  local plugins = {
    {
      "catppuccin/nvim",
       name = "catppuccin",
       config = function()
           require("catppuccin").setup {
              dim_inactive = {
                  enabled = true,
                  shade = "dark",
                  percentage = 0.15,
              },
          }
          vim.cmd.colorscheme "catppuccin"
        end,
    },
    -- {
    --   "folke/tokyonight.nvim",
    --   lazy = false, 
    --   priority = 1000, -- make sure to load this before all the other start plugins
    --   config = function()
    --     vim.cmd([[colorscheme tokyonight-storm]])
    --   end,
    -- },
    --
    -- {
    --   "gbprod/nord.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require("nord").setup({})
    --     vim.cmd.colorscheme("nord")
    --   end,
    -- },
    -- install = {
    --  colorscheme = { "nord" },
    -- },

    {
      "folke/lazy.nvim",
      lazy = false,
    }
  }


  local plugin_files = vim.fn.glob("~/.config/nvim/lua/plugins/*.lua")
  for _, file in ipairs(vim.split(plugin_files, "\n")) do
    -- Skip the init.lua file itself
    if not file:match("init.lua$") then
      local module_name = file:match("([^/]+)%.lua$")
      if module_name then
        local ok, module = pcall(require, "plugins." .. module_name)
        if ok and module then
          table.insert(plugins, module)
        end
      end
    end
  end
  
  return plugins
end

return M
