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
  services.logind.extraConfig = "
    # don't shutdown when power button is short pressed
    HandlePowerKey = ignore
  ";
}
