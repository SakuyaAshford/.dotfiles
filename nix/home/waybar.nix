{
  config,
  pkgs,
  ...
}:
{
  programs.waybar = {
  enable = true;
  }; 

  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "/home/sakuya/.dotfiles/.config/waybar";
}
