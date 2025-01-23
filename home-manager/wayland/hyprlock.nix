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
        };

        background = {
          monitor = "";
          blur_passes = 3;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        };

        input-field = lib.mkForce {
          monitor = "";
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgb(151515)";
          inner_color = "rgb(FFFFFF)";
          fade_on_empty = true;
          fade_timeout = 1000;
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          rounding = 40;
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgb(204, 34, 34)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          position = "0, -20";
          halign = "center";
          valign = "center";
          shadow_passes = 10;
          shadow_size = 20;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.6;
        };

        label = [
          {
            monitor = "";
            text = "cmd[update:1000] echo \"$TIME\"";
            color = "rgba(200, 200, 200, 1.0)";
            font_size = 55;
            font_family = "Fira Semibold";
            position = "-100, 70";
            halign = "right";
            valign = "bottom";
            shadow_passes = 5;
            shadow_size = 10;
          }
          {
            monitor = "";
            text = "$USER";
            color = "rgba(200, 200, 200, 1.0)";
            font_size = 20;
            font_family = "Fira Semibold";
            position = "-100, 160";
            halign = "right";
            valign = "bottom";
            shadow_passes = 5;
            shadow_size = 10;
          }
        ];

        image = {
          monitor = "";
          size = 280;
          rounding = 40;
          border_size = 4;
          border_color = "rgb(221, 221, 221)";
          rotate = 0;
          reload_time = -1;
          position = "0, 200";
          halign = "center";
          valign = "center";
          shadow_passes = 10;
          shadow_size = 20;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.6;
        };
      };
    };
  };
}
