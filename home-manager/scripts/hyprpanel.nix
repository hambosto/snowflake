{
  config,
  lib,
  pkgs,
  ...
}:
let
  hyprpanel-reload = pkgs.writeShellScriptBin "hyprpanel-reload" ''
    [ $(pgrep "ags") ] && pkill ags
    hyprctl dispatch exec hyprpanel
  '';
  cfg = config.modules.wayland.hyprpanel;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ hyprpanel-reload ];
  };
}
