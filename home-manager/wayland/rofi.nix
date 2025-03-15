{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun";
      font = "JetBrainsMono Nerd Font 13";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = true;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      border-radius = 10;
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      lib.mkForce {
        "*" = {
          bg-col = mkLiteral "#${config.lib.stylix.colors.base00}";
          bg-col-light = mkLiteral "#${config.lib.stylix.colors.base01}";
          border-col = mkLiteral "#${config.lib.stylix.colors.base01}";
          selected-col = mkLiteral "#${config.lib.stylix.colors.base01}";
          fg-col = mkLiteral "#${config.lib.stylix.colors.base05}";
          fg-col2 = mkLiteral "#${config.lib.stylix.colors.base08}";
          grey = mkLiteral "#${config.lib.stylix.colors.base03}";
          blue = mkLiteral "#${config.lib.stylix.colors.base0D}";
          accent = mkLiteral "#${config.lib.stylix.colors.base0D}";
          width = mkLiteral "600";
          border-radius = mkLiteral "15px";
        };

        "element-text, element-icon , mode-switcher" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "window" = {
          height = mkLiteral "360px";
          border = mkLiteral "2px";
          border-color = mkLiteral "@accent";
          background-color = mkLiteral "@bg-col";
        };

        "mainbox" = {
          background-color = mkLiteral "@bg-col";
        };

        "inputbar" = {
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
          background-color = mkLiteral "@bg-col";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "2px";
        };

        "prompt" = {
          background-color = mkLiteral "@blue";
          padding = mkLiteral "6px";
          text-color = mkLiteral "@bg-col";
          border-radius = mkLiteral "3px";
          margin = mkLiteral "20px 0px 0px 20px";
        };

        "textbox-prompt-colon" = {
          expand = mkLiteral "false";
          str = mkLiteral ''":"'';
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
          columns = mkLiteral "2";
          lines = mkLiteral "5";
          background-color = mkLiteral "@bg-col";
        };

        "element" = {
          padding = mkLiteral "5px";
          background-color = mkLiteral "@bg-col";
          text-color = mkLiteral "@fg-col";
        };

        "element-icon" = {
          size = mkLiteral "25px";
        };

        "element selected" = {
          background-color = mkLiteral "@selected-col";
          text-color = mkLiteral "@accent";
        };

        "mode-switcher" = {
          spacing = mkLiteral "0";
        };

        "button" = {
          padding = mkLiteral "10px";
          background-color = mkLiteral "@bg-col-light";
          text-color = mkLiteral "@grey";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.5";
        };

        "button selected" = {
          background-color = mkLiteral "@bg-col";
          text-color = mkLiteral "@blue";
        };

        "message" = {
          background-color = mkLiteral "@bg-col-light";
          margin = mkLiteral "2px";
          padding = mkLiteral "2px";
          border-radius = mkLiteral "5px";
        };

        "textbox" = {
          padding = mkLiteral "6px";
          margin = mkLiteral "20px 0px 0px 20px";
          text-color = mkLiteral "@blue";
          background-color = mkLiteral "@bg-col-light";
        };
      };
  };
}
