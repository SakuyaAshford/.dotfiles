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
      "hyprlock"
    ];

    bind =
    [
      "$mod, Q, exec, ghostty"
      "$mod, D, exec, rofi -show drun"

      "$mod, Escape, exec, swaylock"
      "ALT, Escape, exec, hyprlock"

    ];

    input = {
      touchpad = {
        natural_scroll = true;
      };
    };
  };

  extraConfig = "
    monitor = eDP-1, 1920x1080@60, 0x0, 1
    xwayland {
      force_zero_scaling = true
    }
  ";
}
