{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.wayland.rofi;
in
{
  config = lib.mkIf cfg.enable {
    stylix.targets.rofi.enable = false;
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "run,drun,window";
        show-icons = true;
        terminal = "kitty";
        drun-display-format = "{icon} {name}";
        location = 0;
        disable-history = false;
        hide-scrollbar = true;
        display-drun = "   Apps ";
        display-run = "   Run ";
        display-window = " 󰕰  Window";
        display-Network = " 󰤨  Network";
        sidebar-mode = true;
      };
      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
          inherit (config.lib.stylix) colors;
        in
        {
          "*" = {
            bg-col = mkLiteral "#${colors.base00}";
            bg-col-light = mkLiteral "#${colors.base01}";
            border-col = mkLiteral "#${colors.base02}";
            selected-col = mkLiteral "#${colors.base02}";
            blue = mkLiteral "#${colors.base0D}";
            fg-col = mkLiteral "#${colors.base05}";
            fg-col2 = mkLiteral "#${colors.base08}";
            grey = mkLiteral "#${colors.base03}";
            width = mkLiteral "600";
            font = config.stylix.fonts.monospace.name;
          };

          "element-text, element-icon, mode-switcher" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };

          "window" = {
            height = mkLiteral "360px";
            border = mkLiteral "3px";
            border-color = mkLiteral "@border-col";
            background-color = mkLiteral "@bg-col";
            border-radius = mkLiteral "20px";
          };

          "mainbox" = {
            background-color = mkLiteral "@bg-col";
          };

          "inputbar" = {
            children = mkLiteral "[prompt,entry]";
            background-color = mkLiteral "@bg-col";
            border-radius = mkLiteral "20px";
            padding = mkLiteral "2px";
          };

          "prompt" = {
            background-color = mkLiteral "@blue";
            padding = mkLiteral "6px";
            text-color = mkLiteral "@bg-col";
            border-radius = mkLiteral "20px";
            margin = mkLiteral "20px 0px 0px 20px";
          };

          "textbox-prompt-colon" = {
            expand = false;
            str = ":";
          };

          "entry" = {
            padding = mkLiteral "6px";
            margin = mkLiteral "20px 0px 0px 10px";
            text-color = mkLiteral "@fg-col";
            background-color = mkLiteral "@bg-col";
          };

          "listview" = {
            border = mkLiteral "0px 0px 0px";
            padding = mkLiteral "6px 0px 0px";
            margin = mkLiteral "10px 0px 0px 20px";
            columns = 2;
            lines = 5;
            background-color = mkLiteral "@bg-col";
          };

          "element" = {
            padding = mkLiteral "5px";
            background-color = mkLiteral "@bg-col";
            text-color = mkLiteral "@fg-col";
            border-radius = mkLiteral "20px";
          };

          "element-icon" = {
            size = mkLiteral "25px";
          };

          "element selected" = {
            background-color = mkLiteral "@selected-col";
            text-color = mkLiteral "@fg-col2";
            border-radius = mkLiteral "20px";
          };

          "mode-switcher" = {
            spacing = 0;
          };

          "button" = {
            padding = mkLiteral "10px";
            background-color = mkLiteral "@bg-col-light";
            text-color = mkLiteral "@grey";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.5";
            border-radius = mkLiteral "20px";
          };

          "button selected" = {
            background-color = mkLiteral "@bg-col";
            text-color = mkLiteral "@blue";
            border-radius = mkLiteral "20px";
          };

          "message" = {
            background-color = mkLiteral "@bg-col-light";
            margin = mkLiteral "2px";
            padding = mkLiteral "2px";
            border-radius = mkLiteral "20px";
          };

          "textbox" = {
            padding = mkLiteral "6px";
            margin = mkLiteral "20px 0px 0px 20px";
            text-color = mkLiteral "@blue";
            background-color = mkLiteral "@bg-col-light";
            border-radius = mkLiteral "20px";
          };
        };
    };
  };
}
