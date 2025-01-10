{
  pkgs,
  ...
}:
{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    # lowLatency.enable = true;
  };
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
