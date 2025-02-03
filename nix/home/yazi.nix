{ inputs, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      manager = {
        ratio = [ 1 4 3 ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
        scrolloff = 5;
        mouse_events = [ "click" "scroll" ];
        title_format = "Yazi: {cwd}";
      };

      preview = {
        wrap = "no";
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        image_delay = 30;
        image_filter = "triangle";
        image_quality = 75;
        sixel_fraction = 15;
        ueberzug_scale = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };

      opener = {
        edit = [
          { run = ''${"$"}EDITOR:-vi "$@"''; desc = "$EDITOR"; block = true; for = "unix"; }
        ];
        open = [
          { run = "xdg-open \"$1\""; desc = "Open"; for = "linux"; }
        ];
        reveal = [
          { run = "xdg-open \"$(dirname \"$1\")\""; desc = "Reveal"; for = "linux"; }
        ];
        play = [
          { run = "mpv --force-window \"$@\""; orphan = true; for = "unix"; }
        ];
        image = [
          { run = "imv \"$@\""; desc = "Open with imv"; }
        ];
        pdf = [
          { run = "zathura \"$@\""; desc = "Open with zathura"; }
        ];
      };

      open.rules = [
        { name = "*/"; use = [ "edit" "open" "reveal" ]; }
        { mime = "text/*"; use = [ "edit" "reveal" ]; }
        { mime = "image/*"; use = [ "image" "reveal" ]; }
        { mime = "application/pdf"; use = [ "pdf" "reveal" ]; }
        { mime = "{audio,video}/*"; use = [ "play" "reveal" ]; }
        { name = "*"; use = [ "open" "reveal" ]; }
      ];

      tasks = {
        micro_workers = 10;
        macro_workers = 25;
        bizarre_retry = 5;
        image_alloc = 536870912;  # 512MB
        suppress_preload = false;
      };

      input = {
        cursor_blink = false;
        cd = {
          title = "Change directory:";
          origin = "top-center";
          offset = [ 0 2 50 3 ];
        };
        rename = {
          title = "Rename:";
          origin = "hovered";
          offset = [ 0 1 50 3 ];
        };
      };

      confirm = {
        trash = {
          title = "Trash {n} selected file{s}?";
          origin = "center";
          offset = [ 0 0 70 20 ];
        };
        delete = {
          title = "Permanently delete {n} selected file{s}?";
          origin = "center";
          offset = [ 0 0 70 20 ];
        };
      };

      log.enabled = false;
    };

    plugins = {
      full-border = "${inputs.yazi-plugins}/full-border.yazi";
    };
  };
  xdg.configFile."yazi/init.lua".text = ''
    require("full-border"):setup({
      border = "single",
      blend = 50,
      fg = "#d8dee9",  -- Nord snow
      bg = "#2e3440"   -- Nord polar night
    })
  '';

}
