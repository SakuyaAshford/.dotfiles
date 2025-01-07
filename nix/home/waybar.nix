{
  config,
  pkgs,
  ...
}: let
  color = {
    rosewater = "#F5E0DC";
    flamingo = "#F2CDCD";
    pink = "#F5C2E7";
    mauve = "#DDB6F2";
    red = "#F28FAD";
    maroon = "#E8A2AF";
    peach = "#F8BD96";
    yellow = "#FAE3B0";
    green = "#ABE9B3";
    teal = "#B5E8E0";
    blue = "#96CDFB";
    sky = "#89DCEB";
    lavender = "#C9CBFF";
    black0 = "#0D1416"; # crust
    black1 = "#111719"; # mantle
    black2 = "#131A1C"; # base
    black3 = "#192022"; # surface0
    black4 = "#202729"; # surface1
    gray0 = "#363D3E"; # surface2
    gray1 = "#4A5051"; # overlay0
    gray2 = "#5C6262"; # overlay1
    white = "#C5C8C9"; # text
  };
in {
  enable = true;
  settings = [
    {
      layer = "top";
      position = "top";
      exclusive = true;
      fixed-center = true;
      gtk-layer-shell = true;
      spacing = 0;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;

      # Only include modules for the top-left bar
      modules-left = [
        "image"
        "hyprland/workspaces"
        "idle_inhibitor"
        "hyprland/window"
      ];

      # Configuration for the modules
      "image" = {
        path = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        size = 24;
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{id}";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "󰅶";
          deactivated = "󰾪";
        };
      };

      "hyprland/window" = {
        format = "{title}";
        icon = true;
        icon-size = 24;
        separate-outputs = true;
      };
    }
  ];

  style = ''
    /* Global */
    * {
      all: unset;
      font-family: "GeistMono Nerd Font Propo", sans-serif;
      font-size: 11pt;
      font-weight: 500;
    }

    /* Waybar */
    window#waybar {
      background: ${color.black0};
    }

    .modules-left {
      padding-left: 0.25rem;
    }

    /* Modules */
    #workspaces,
    #workspaces button,
    #idle_inhibitor,
    #image,
    #window {
      background: ${color.black3};
      border-radius: 8px;
      margin: 0.5rem 0.25rem;
      transition: 300ms linear;
    }

    #image,
    #window {
      padding: 0.25rem 0.75rem;
    }

    #idle_inhibitor {
      background: ${color.blue};
      color: ${color.black3};
      border-radius: 8px;
      font-size: 13pt;
      padding: 0.25rem;
      min-width: 1.5rem;
      transition: 300ms linear;
    }

    /* Workspaces */
    #workspaces button {
      margin: 0;
      padding: 0.25rem;
      min-width: 1.5rem;
    }

    #workspaces button label {
      color: ${color.white};
    }

    #workspaces button.empty label {
      color: ${color.gray0};
    }

    #workspaces button.urgent label,
    #workspaces button.active label {
      color: ${color.black3};
    }

    #workspaces button.urgent {
      background: ${color.red};
    }

    #workspaces button.active {
      background: ${color.blue};
    }

    /* Idle Inhibitor */
    #idle_inhibitor.deactivated {
      color: ${color.gray0};
    }

    /* Hover effects */
    #workspaces button:hover,
    #idle_inhibitor:hover,
    #idle_inhibitor.deactivated:hover {
      background: lighter(${color.black3});
    }

    #workspaces button.urgent:hover {
      background: lighter(${color.red});
    }

    #workspaces button.active:hover {
      background: lighter(${color.blue});
    }

    #workspaces button:hover label {
      color: lighter(${color.white});
    }

    #workspaces button.empty:hover label {
      color: lighter(${color.gray0});
    }

    #idle_inhibitor:hover {
      color: lighter(${color.blue});
    }

    #idle_inhibitor.deactivated:hover {
      color: lighter(${color.gray0});
    }
  '';
}
