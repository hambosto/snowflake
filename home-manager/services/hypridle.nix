{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.services.hypridle;
in
{
  config = lib.mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      settings = {

        general = {
          ignore_dbus_inhibit = false;
          lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 600;
            on-timeout = "loginctl lock-session";
          }

          {
            timeout = 660;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }

          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
