{ pkgs, ... }:
{
  networking = {
    # Configure network proxy if necessary
    hostName = "nixos";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        8384
        22000 # Syncthing
        # 59010
        # 59011
      ];
      allowedUDPPorts = [
        # https://docs.syncthing.net/users/firewall.html
        22000
        21207
        # 59010
        # 59011
      ];
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
