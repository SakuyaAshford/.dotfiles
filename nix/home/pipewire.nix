{
  pkgs, 
  ...
}: {
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alse.enable = true;
    alsa.support32Bit = true;
    pulse.enable= true;
  };
  enviroment.systemPackages = with pkgs; [ pulseaudioFull ];
}
