{
  config,
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

  # Creates a symlink from the Neovim config directory (e.g. ~/.config/nvim)
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "/home/sakuya/.dotfiles/.config/nvim";

  programs.nvf = {
    enable = false; # enabling it will change the config to ~/.config/nvf
  };
}
