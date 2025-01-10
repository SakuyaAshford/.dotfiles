{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sakuya";
  home.homeDirectory = "/home/sakuya";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # CLI
    bat
    bottom
    disfetch
    eza # ls replacement
    fd # find replacement
    ripgrep # grep replacement
    onefetch

    # hyprland
    swww
    poweralertd
    wayland
    cliphist
    wl-clipboard
    wl-clip-persist
    wf-recorder

    # Apps
    evince # pdf
    libreoffice
    obs-studio

    inputs.zen-browser.packages."${system}".default

    # Utility
    # nixfmt-rfc-style
    # treefmt2
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sakuya/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    NIXOS_OZONE_WL = "1";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    WLR_NO_HARDWARE_CURSORS = "1";
    _JAVA_AWT_WM_NOREPARENTING = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.kitty.enable = true;
  # wayland.windowManager.hyprland.enable = true;

  programs = {
    fzf = import ./fzf.nix { inherit pkgs; };
    neovim = import ./neovim.nix { inherit config pkgs; };
    zsh = import ./zsh.nix { inherit config pkgs lib; };
    git = import ./git.nix { inherit config pkgs; };
    zoxide = import ./zoxide.nix { inherit pkgs; };
    # pipewire = import ./pipewire.nix { inherit pkgs; };

    # ghostty = import ./ghostty.nix { inherit inputs pkgs; };
    waybar = import ./waybar.nix { inherit config pkgs; };
    swaylock = import ./swaylock.nix {
      inherit
        config
        lib
        pkgs
        inputs
        ;
    };
    # swaync = import ./swaync.nix { inherit pkgs; };

  };
  imports = [
    ./ghostty.nix
    #  ./wayland.nix
    ./hyprlock.nix
    ./rofi.nix
    ./swaync.nix
    ./swayosd.nix
  ];

  wayland.windowManager = {
    hyprland = (import ./hyprland.nix { inherit pkgs; });
  };
}
