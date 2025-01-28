{ pkgs, ... }:
{
  home.packages = (with pkgs; [ rofi-wayland ]);

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      bg-col: #2e3440;
      bg-col-light: #3b4252;
      border-col: #4c566a;
      selected-col: #3b4252;
      fg-col: #d8dee9;
      fg-col2: #eceff4;
      grey: #88c0d0;
      highlight: #81a1c1;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration{
      modi: "run,drun,window";
      lines: 10;
      cycle: false;
      font: "Cantarell Semibold 20";
      show-icons: true;
      icon-theme: "Papirus-dark";
      terminal: "ghostty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: true;
      hide-scrollbar: true;
      display-drun: " Apps ";
      display-run: " Run ";
      display-window: " Window ";
      sidebar-mode: false;
      sorting-method: "fzf";
      width: 40%;
    }

    @theme "theme"

    element-text, element-icon, mode-switcher {
      background-color: inherit;
      text-color:       inherit;
    }

    window {
      width: 40%;
      border: none;
      background-color: @bg-col;
      margin: 0px;
    }

    mainbox {
      background-color: @bg-col;
    }

    inputbar {
      children: [prompt, entry];
      background-color: @bg-col-light;
      border-radius: 5px;
      padding: 0px;
      margin: 5px;
    }

    prompt {
      background-color: inherit;
      padding: 4px;
      text-color: @fg-col;
      margin: 0px 5px;
    }

    textbox-prompt-colon {
      expand: false;
      str: "Search:";
    }

    entry {
      padding: 6px;
      margin: 0px 5px;
      text-color: @fg-col;
      background-color: inherit;
      border-radius: 3px;
    }

    listview {
      padding: 5px 0px;
      margin: 5px;
      columns: 1;
      background-color: @bg-col;
    }

    element {
      padding: 8px;
      margin: 2px 5px;
      background-color: @bg-col;
      text-color: @fg-col;
      border-radius: 3px;
    }

    element-icon {
      size: 28px;
    }

    element selected {
      background-color: @selected-col;
      text-color: @fg-col2;
    }

    mode-switcher {
      spacing: 0;
    }

    button {
      padding: 10px;
      background-color: @bg-col-light;
      text-color: @grey;
    }

    button selected {
      background-color: @selected-col;
      text-color: @fg-col2;
    }
  '';
}
