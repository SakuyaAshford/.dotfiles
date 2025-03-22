{ pkgs, config, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    geist-font
    nerd-fonts.geist-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
  ];
  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 22;
  };
  gtk = {
    enable = true;
    font = {
      name = "Maple Mono";
      size = 12;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };
  };
}
