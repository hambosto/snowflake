{
  config,
  lib,
  pkgs,
  ...
}:
let
  menu = pkgs.writeShellScriptBin "menu" ''
    if pgrep -x "rofi" > /dev/null; then
      pkill -x rofi
      exit 0
    fi
    rofi -show drun
  '';
  hyprpanel-reload = pkgs.writeShellScriptBin "hyprpanel-reload" ''
    [ $(pgrep "ags") ] && pkill ags
    hyprctl dispatch exec hyprpanel
  '';
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      menu
      hyprpanel-reload
    ];
  };
}
