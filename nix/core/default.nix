{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}:
{
  imports = [
    ./app/syncthing.nix
    ./bootloader.nix
    ./bluetooth.nix
    ./dev.nix
    ./font.nix
    ./network.nix
    ./program.nix
    ./security.nix
    ./service.nix
    ./system.nix
    ./sound.nix
    ./user.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
