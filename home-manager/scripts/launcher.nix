{
  config,
  lib,
  pkgs,
  ...
}:
let
  launcher = pkgs.writeShellScriptBin "launcher" ''
    if [[ ! $(pidof rofi) ]]; then
    	rofi -show drun
    else
    	pkill rofi
    fi
  '';
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ launcher ];
  };
}
