{
  pkgs,
  ...
}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      geist-font
      nerd-fonts.geist-mono
    ];
  };
}

