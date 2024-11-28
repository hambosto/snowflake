{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.services.clipman;
in
{
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings.exec-once = [ "${pkgs.clipman}/bin/clipman clear --all" ];
    services.clipman.enable = true;
    systemd.user.services.clipman = {
      Service = {
        ExecStart = lib.mkForce "${pkgs.wl-clipboard}/bin/wl-paste -t text --watch ${pkgs.clipman}/bin/clipman store --no-persist";
      };
    };
  };
}
