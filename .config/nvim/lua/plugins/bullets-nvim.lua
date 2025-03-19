return {
  {
    "dkarter/bullets.vim",
    enabled = false,
    event = "BufReadPre",
    config = function()
      -- Configure the filetypes where bullets.vim should be active.
      vim.g.bullets_enabled_filetypes = { "markdown", "text", "gitcommit" }
    end,
  },
}

