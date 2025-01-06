{
  pkgs,
  ...
}: {
  enable = true;
  xwayland = {
    enable = true;
  };
  systemd.enable = true;
  settings = {

    general = {
      "$mod" = "SUPER";
    };

    exec-once = [
      "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT DESKTOP"

      "swww-daemon &"
      "nm-applet &"
      "poweralertd &"
      "waybar &"
      "swaync &"
      "wl-clip-persists --clipboard both &"
      "wl-paste --watch cliphist store &"

      "hyprctl setcursor Bibata-Modern-Ice 24 &"
    ];

    bind =
    [
      "$mod, Q, exec, ghostty"
      "$mod SHIFT, B, exec, toggle_waybar"

    ];
  };
  
}
