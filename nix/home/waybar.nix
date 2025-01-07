{
  pkgs,
  ...
}: {
  
  enable = true;
  package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  });
  settings = {
    "top_bar" = {
      layer = "top";
      position = "top";
      height = 36;
      spacing = 4;
      modules-left = [ "hyprland/workspaces" "hyprland/submap" ];

      "hyprland/workspaces" = {
        on-click = "activate";  
        format = "{icon}";
        format-icons = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            "6" = "󰲪";
            "7" = "󰲬";
            "8" = "󰲮";
            "9" = "󰲰";
            "10" = "󰿬";
            "special" = "";

        };
        show-special = true;
        persistent-workspaces = {
            "*" = 10;  
        };
      };

      "hyprland/submap" =  {
        format = "<span color='#a6da95'>Mode:</span> {}";
        tooltip = false;
      };
 
 


    };
  };
}
