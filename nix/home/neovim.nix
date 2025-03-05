{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings.vim = {
      vimAlias = true;
      viAlias = true;

      theme = {
        enable = true;
        name = "catppuccin";
        style = "frappe";
        transparent = true;
      };
      telescope.enable = true;

      spellcheck = {
        enable = true;
      };
      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = false;
        lsplines.enable = false;
        nvim-docs-view.enable = false;
      };

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        python.enable = true;
        rust.enable = true;
      };

      visuals = {
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "catppuccin";
        };
      };

      autopairs.nvim-autopairs.enable = true;
    };
  };
}
