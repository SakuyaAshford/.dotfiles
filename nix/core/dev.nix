{ pkgs, ... }:
{
  # Enable MariaDB service
  services.mysql = {
    enable = true;
    package = pkgs.mysql80;
    
  };
}
