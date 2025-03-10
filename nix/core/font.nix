{
  pkgs,
  ...
}:
{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      geist-font
      nerd-fonts.geist-mono
    ];
  };
}
