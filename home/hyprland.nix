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
      "swww-daemon &"
      "nm-applet &"
      "poweralertd &"
      "waybar &"
      "swaync &"
      "wl-clip-persists --clipboard both &"
      "wl-paste --watch cliphist store &"
    ];

    bind =
    [
      "$mod, Q, exec, ghostty"
      "mod SHIFT, B, exec, toggle_waybar"

    ];
  };
  
}
