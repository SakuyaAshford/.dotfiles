{
  inputs,
  pkgs,
  ...
}:
{
  enable = true;
  package = inputs.hyprland.packages.${pkgs.system}.default;
  portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  xwayland = {
    enable = true; # enabled for screen sharing
  };
  systemd.enable = true;
  settings = {
    general = {
      "$mod" = "SUPER";
      layout = "dwindle";
      gaps_in = 0;
      gaps_out = 0;
      border_size = 2;
      "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
      "col.inactive_border" = "0x00000000";
      # border_part_of_window = false;
      no_border_on_floating = false;
    };

    exec-once = [
      "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT DESKTOP"

      "swww-daemon & sleep 0.1 & swww img ~/Pictures/wallpaper/panes.jpg &"
      "nm-applet &"
      "poweralertd &"
      "waybar &"
      "swaync &"
      "wl-clip-persists --clipboard both &"
      "wl-paste --watch cliphist store &"

      "hyprctl setcursor Bibata-Modern-Ice 24 &"
      "hyprlock"
    ];

    bind = [

      "$mod, Q, exec, ghostty"
      "$mod, D, exec, rofi -show drun"

      # Utlity
      # screenshot
      ",Print, exec, screenshot --copy"
      "$mod, Print, exec, screenshot --save"
      "$mod SHIFT, Print, exec, screenshot --swappy"

      # Explorer
      "$mod, E, exec, nemo"
      "ALT, E, exec, hyprctl dispatch exec '[float; size 1111 700] nemo'"
      "$mod SHIFT, E, exec, hyprctl dispatch exec '[float; size 1111 700] ghostty -e yazi'"

      "$mod, Escape, exec, swaylock"
      "ALT, Escape, exec, hyprlock"

      # switch focus
      "$mod, left,  movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up,    movefocus, u"
      "$mod, down,  movefocus, d"
      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"

      "$mod, left,  alterzorder, top"
      "$mod, right, alterzorder, top"
      "$mod, up,    alterzorder, top"
      "$mod, down,  alterzorder, top"
      "$mod, h, alterzorder, top"
      "$mod, j, alterzorder, top"
      "$mod, k, alterzorder, top"
      "$mod, l, alterzorder, top"

      # switch workspace
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # same as above, but switch to the workspace
      "$mod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod SHIFT, 6, movetoworkspacesilent, 6"
      "$mod SHIFT, 7, movetoworkspacesilent, 7"
      "$mod SHIFT, 8, movetoworkspacesilent, 8"
      "$mod SHIFT, 9, movetoworkspacesilent, 9"
      "$mod SHIFT, 0, movetoworkspacesilent, 10"
      "$mod CTRL, c, movetoworkspace, empty"

      # window control
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, j, movewindow, d"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, l, movewindow, r"

      "$mod CTRL, left, resizeactive, -80 0"
      "$mod CTRL, right, resizeactive, 80 0"
      "$mod CTRL, up, resizeactive, 0 -80"
      "$mod CTRL, down, resizeactive, 0 80"
      "$mod CTRL, h, resizeactive, -80 0"
      "$mod CTRL, j, resizeactive, 0 80"
      "$mod CTRL, k, resizeactive, 0 -80"
      "$mod CTRL, l, resizeactive, 80 0"

      "$mod ALT, left, moveactive,  -80 0"
      "$mod ALT, right, moveactive, 80 0"
      "$mod ALT, up, moveactive, 0 -80"
      "$mod ALT, down, moveactive, 0 80"
      "$mod ALT, h, moveactive,  -80 0"
      "$mod ALT, j, moveactive, 0 80"
      "$mod ALT, k, moveactive, 0 -80"
      "$mod ALT, l, moveactive, 80 0"

    ];

    input = {
      touchpad = {
        natural_scroll = true;
      };
    };

    decoration = {
      rounding = 0;
      # active_opacity = 0.90;
      # inactive_opacity = 0.90;
      # fullscreen_opacity = 1.0;

      blur = {
        enabled = true;
        size = 1;
        passes = 1;
        # size = 4;
        # passes = 2;
        brightness = 1;
        contrast = 1.400;
        ignore_opacity = true;
        noise = 0;
        new_optimizations = true;
        xray = true;
      };

      shadow = {
        enabled = true;

        ignore_window = true;
        offset = "0 2";
        range = 20;
        render_power = 3;
        color = "rgba(00000055)";
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "fluent_decel, 0, 0.2, 0.4, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutCubic, 0.33, 1, 0.68, 1"
        "easeinoutsine, 0.37, 0, 0.63, 1"
      ];

      animation = [
        # Windows
        "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
        "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
        "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

        # Fade
        "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
        "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
        "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
        "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
        "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
        "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
        "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
        "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
      ];
    };

    misc = {
      disable_autoreload = true;
      disable_hyprland_logo = true;
      always_follow_on_dnd = true;
      layers_hog_keyboard_focus = true;
      animate_manual_resizes = false;
      enable_swallow = true;
      focus_on_activate = true;
    };

    # windowrule
    windowrule = [
      "float,title:^(Transmission)$"
      "float,title:^(Volume Control)$"
      "float,title:^(Firefox — Sharing Indicator)$"
      "move 0 0,title:^(Firefox — Sharing Indicator)$"
      "size 700 450,title:^(Volume Control)$"
      "move 40 55%,title:^(Volume Control)$"
    ];

    # windowrulev2
    windowrulev2 = [
      "float, title:^(Picture-in-Picture)$"
      "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "opacity 1.0 override 1.0 override, class:(Aseprite)"
      "opacity 1.0 override 1.0 override, class:(Unity)"
      "opacity 1.0 override 1.0 override, class:(zen)"
      "opacity 1.0 override 1.0 override, class:(evince)"
      "workspace 1, class:^(ghostty)$"
      "workspace 2, class:^(zen)$"
      "workspace 3, class:^(Obsidian)$"
      "workspace 5, class:^(Spotify)$"
      "idleinhibit fullscreen, class:^(firefox)$"
      "float,class:^(org.gnome.Calculator)$"
      "float,class:^(waypaper)$"
      "float,class:^(zenity)$"
      "size 850 500,class:^(zenity)$"
      "float,class:^(org.gnome.FileRoller)$"
      "float,class:^(pavucontrol)$"
      "float,class:^(SoundWireServer)$"
      "float,class:^(.sameboy-wrapped)$"
      "float,class:^(file_progress)$"
      "float,class:^(confirm)$"
      "float,class:^(dialog)$"
      "float,class:^(download)$"
      "float,class:^(notification)$"
      "float,class:^(error)$"
      "float,class:^(confirmreset)$"
      "float,title:^(Open File)$"
      "float,title:^(File Upload)$"
      "float,title:^(branchdialog)$"
      "float,title:^(Confirm to replace files)$"
      "float,title:^(File Operation Progress)$"

      "opacity 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"

      # No gaps when only
      "bordersize 0, floating:0, onworkspace:w[t1]"
      "rounding 0, floating:0, onworkspace:w[t1]"
      "bordersize 0, floating:0, onworkspace:w[tg1]"
      "rounding 0, floating:0, onworkspace:w[tg1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:f[1]"

      "maxsize 1111 700, floating: 1"
      "center, floating: 1"

      # Remove context menu transparency in chromium based apps
      "opaque,class:^()$,title:^()$"
      "noshadow,class:^()$,title:^()$"
      "noblur,class:^()$,title:^()$"
    ];
  };

  extraConfig = "
    monitor = eDP-1, 1920x1080@60, 0x0, 1

    monitor = HDMI-A-1, 1920x1080@60, 1920x0, 1
    monitor=DP-1,1920x1080,0x0,1

    xwayland {
      force_zero_scaling = true
    }

    bindl=,switch:Lid Switch,exec,systemctl suspend
  ";
}
