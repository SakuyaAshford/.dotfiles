{ ... }:
{
  services.syncthing = {
    enable = true; 
    dataDir = "/home/sakuya/Documents";
    configDir = "/home/sakuya/.config/syncthing";
    user = "sakuya";
    group = "users";
    tray.enable = true;
  };
}

