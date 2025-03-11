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
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
    };
    gtk = {
        enable = true;
        font = {
            name = "Maple Mono";
            size = 12;
        };
        theme = {
            name = "Catppuccin";
            package = pkgs.catppuccin-gtk.override {
                variant = "mocha";
                accents = [ "lavender" ]; 
                tweaks = [ "rimless" "float" ];
            };
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme.override { color = "black"; };
        };
        cursorTheme = {
            name = "Bibata-Modern-Ice";
            package = pkgs.bibata-cursors;
            size = 24;
        };
    };
}
