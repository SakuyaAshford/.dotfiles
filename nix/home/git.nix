{
  config, 
  pkgs,
  ...
}: {
  enable = true;
  lfs.enable = true;
  userName = "SakuyaAshford";
  userEmail = "182094416+SakuyaAshford@users.noreply.github.com";

  extraConfig = {
    pull = {
      rebase = true;
    };
    init = {
      defaultBranch = "main";
    };
  };
}
