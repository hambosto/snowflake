{
  config,
  lib,
  ...
}: let
  cfg = config.modules.wayland.hyprlock;
in {
  config = lib.mkIf cfg.enable {
    stylix.targets.hyprlock.enable = true;
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          grace = 5;
          no_fade_in = false;
          disable_loading_bar = true;
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
          size = "300, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(255, 255, 255, 0.1)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          font_family = config.stylix.fonts.sansSerif.name + "Bold";
          placeholder_text = "<i>🔒 Enter Password...</i>";
          hide_input = false;
          position = "0, -290";
          halign = "center";
          valign = "center";
        };
        label = [
          {
            monitor = "";
            text = ''cmd[update:1000] echo -e "$(date +"%A, %d %B %Y")"'';
            color = "#${config.lib.stylix.colors.base05}";
            font_size = 24;
            font_family = config.stylix.fonts.sansSerif.name + " Regular";
            position = "0, 500";
            halign = "center";
            valign = "center";
          }
          {
            monitor = "";
            text = ''cmd[update:1000] echo "<b>$(date +"%H:%M:%S")</b>"'';
            color = "#${config.lib.stylix.colors.base05}";
            font_size = 120;
            font_family = config.stylix.fonts.sansSerif.name + " Bold";
            position = "0, 350";
            halign = "center";
            valign = "center";
          }
          {
            monitor = "";
            text = "Hello, ${config.settings.system.fullName}!";
            color = "#${config.lib.stylix.colors.base0A}";
            font_size = 20;
            font_family = config.stylix.fonts.sansSerif.name;
            position = "0, 150";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
