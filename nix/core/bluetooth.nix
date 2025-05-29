{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    # autoEnable = true; # Automatically enable Bluetooth on boot
    settings.general = {
        ControllerMode = "dual";
    };
  };
}
