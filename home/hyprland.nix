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
    bind =
    [
      "$mod, Q, exec, kitty"
    ];
  };
  
}
