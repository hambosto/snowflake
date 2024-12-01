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
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ menu ];
  };
}
