{
  config, 
  pkgs,
  ...
}: {
  enable = true;
  lfs.enable = true;
  userName = "SakuyaAshford";
  userEmail = "145197577+Sakuya3rd0@users.noreply.github.com";

  extraConfig = {
    pull = {
      rebase = true;
    };
    init = {
      defaultBranch = "main";
    };
  };
}
