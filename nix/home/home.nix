{
  inputs,
  config,
  pkgs,
  lib,
  username,
  ...
}:
{
  home.packages = with pkgs; [
    # CLI
    bat
    bottom
    disfetch
    eza # ls replacement
    fd # find replacement
    pamixer # pulseaudio cli mixer
    pavucontrol
    ripgrep # grep replacement
    onefetch

    # hyprland
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast # screenshot
    grim
    hyprpicker
    swappy # snapshot editing tool
    swww
    poweralertd
    wayland
    cliphist
    wl-clipboard
    wl-clip-persist
    wf-recorder

    # Apps
    evince # pdf
    flameshot # screenshoot
    imv # image viewer
    libreoffice
    mpv # video player
    obs-studio
    obsidian
    zotero_7

    inputs.zen-browser.packages."${system}".default

    # Programming Language
    # C / C++
    gcc
    gdb
    gnumake

    # Python
    python3
    python312Packages.ipython

    # Utility
    # nixfmt-rfc-style
    # treefmt2
    unzip
    xdg-utils

    # bluetooth
    blueman
    bluez
    bluez-tools

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

  programs = {
    fzf = import ./fzf.nix { inherit pkgs; };
    oh-my-posh = import ./oh-my-posh.nix { inherit pkgs; };
    zsh = import ./zsh.nix { inherit config pkgs lib; };
    git = import ./git.nix { inherit config pkgs; };
    zoxide = import ./zoxide.nix { inherit pkgs; };
    # pipewire = import ./pipewire.nix { inherit pkgs; };

    # ghostty = import ./ghostty.nix { inherit inputs pkgs; };
    # waybar = import ./waybar.nix { inherit config pkgs; };
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
    ./gtk.nix
    #  ./wayland.nix
    ./hyprlock.nix
    ./nemo.nix
    ./neovim.nix
    ./rofi.nix
    ./spicetify.nix
    ./swaync.nix
    ./swayosd.nix
    ./waybar.nix
    ./waypaper.nix
    ./xdg-mimes.nix
    ./yazi.nix

    ./script.nix
  ];

  wayland.windowManager = {
    hyprland = import ./hyprland.nix { inherit inputs pkgs; };
  };

}
