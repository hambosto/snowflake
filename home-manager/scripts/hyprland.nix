{
  config,
  lib,
  pkgs,
  ...
}:
let
  close-active-windows = pkgs.writeShellScriptBin "close-active-windows" ''
    active_workspace=$(hyprctl -j activeworkspace | ${pkgs.jq}/bin/jq -r '.id')
    addresses=$(hyprctl -j clients | ${pkgs.jq}/bin/jq -r ".[] | select(.workspace.id == $active_workspace) | .address")

    for address in $addresses; do
      hyprctl dispatch closewindow address:$address
    done
  '';
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ close-active-windows ];
  };
}
