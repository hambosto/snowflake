{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.wayland.hyprlock;
in
{
  config = lib.mkIf cfg.enable {
    stylix.targets.hyprlock.enable = true;
    programs.hyprlock = {
      enable = true;

      settings = {
        general = {
          ignore_empty_input = true;
          grace = 0;
        };

        background = {
          blur_passes = 3;
          blur_size = 10;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
        };

        input-field = lib.mkForce {
          monitor = "";
          size = "250, 50";
          outline_thickness = 0;
          dots_size = 0.26;
          inner_color = "#${config.lib.stylix.colors.base05}";
          dots_spacing = 0.64;
          dots_center = true;
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          check_color = "rgb(40, 200, 250)";
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        };

        label = [
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M\") </big></b>\"";
            color = "#${config.lib.stylix.colors.base05}";
            font_size = 64;
            font_family = "JetBrains Mono Nerd Font 10";
            position = "0, -70";
            halign = "center";
            valign = "center";
          }
          {
            monitor = "";
            text = "cmd[update:18000000] echo \"<b> \"$(date +\'%A, %-d %B %Y\')\"\</b>\"";
            color = "#${config.lib.stylix.colors.base05}";
            font_size = 24;
            font_family = "JetBrains Mono Nerd Font 10";
            position = "0, -120";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
