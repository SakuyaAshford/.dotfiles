{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    bluez
    bluez-tools
  ]);

  # Enable Bluetooth agent for pairing
  home.services.bluetoothctl = {
    enable = true;
    agent = {
      enable = true;
      capability = "KeyboardDisplay";
    };
  };

  # pulseaudio for Bluetooth audio support
  home.services.pulseaudio = {
    enable = true;
    modules = [ "module-bluetooth-discover" ];
  };
}
