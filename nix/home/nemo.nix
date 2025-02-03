# nemo.nix (minimal changes)
{ pkgs, ... }:
{
  home.packages = (with pkgs; [ nemo ]);

  dconf.settings = {
    "org/nemo/preferences" = {
      always-use-browser = true;
      close-device-view-on-device-eject = true;
      date-font-choice = "auto-mono";
      date-format = "iso";
      show-hidden-files = false;  # Align with Yazi's show_hidden
      show-thumbnails = true;     # Enable previews
      thumbnail-limit = 1073741824; # 1GB (align with Yazi's image handling)
    };
    "org/nemo/window-state" = {
      sidebar-width = 300;        # More balanced ratio
    };
  };
}
