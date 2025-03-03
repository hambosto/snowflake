{
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
in
{
  home.packages = [ launcher ];
}
