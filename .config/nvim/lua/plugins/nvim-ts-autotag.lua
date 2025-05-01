return {
    "windwp/nvim-ts-autotag",
    ft = { "html", "svelte", "markdown" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_clash = true,
        filetypes = { "svelte", "html" },
    }
}
