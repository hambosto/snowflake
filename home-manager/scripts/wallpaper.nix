{
  pkgs,
  username,
  ...
}: let
  random-wallpaper = pkgs.writeShellScriptBin "random-wallpaper" ''
    directory=/home/${username}/Pictures
    monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

    if [ -d "$directory" ]; then
        random_background=$(find "$directory" -type f \( -name '*.png' -o -name '*.jpg' \) | shuf -n 1)

        hyprctl hyprpaper unload all
        hyprctl hyprpaper preload $random_background
        hyprctl hyprpaper wallpaper "$monitor, $random_background"
    fi
  '';
in {
  home.packages = [random-wallpaper];
}
