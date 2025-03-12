{
  config,
  inputs,
  pkgs,
  ...
}:
let
  ghostty = inputs.ghostty.packages.x86_64-linux.default;
in
{
  home.packages = (with pkgs; [ ghostty ]);
  xdg.configFile."ghostty".source =
    config.lib.file.mkOutOfStoreSymlink "/home/sakuya/.dotfiles/.config/ghostty";

}
