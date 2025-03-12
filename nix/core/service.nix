{ pkgs, ... }:
{
  services = {
    dbus.enable = true;
    fstrim.enable = true;

    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];
  };
  # In your configuration.nix
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
    extraConfig = ''
      HandlePowerKey=ignore
    '';
  };
}
