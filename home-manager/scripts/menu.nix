{
  pkgs,
  ...
}:
let
  menu = pkgs.writeShellScriptBin "menu" ''
    if [[ ! $(pidof rofi) ]]; then
    	rofi -show drun
    else
    	pkill rofi
    fi
  '';
in
{
  home.packages = [ menu ];
}
