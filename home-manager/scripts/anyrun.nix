{
  config,
  lib,
  pkgs,
  ...
}:
let
  launcher = pkgs.writeShellScriptBin "launcher" ''
    if [[ ! $(pidof anyrun) ]]; then
    	anyrun
    else
    	pkill anyrun
    fi
  '';
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ launcher ];
  };
}
