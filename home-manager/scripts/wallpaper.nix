{
  config,
  lib,
  pkgs,
  ...
}:
let
  wallpaper-selector = pkgs.writeShellScriptBin "wallpaper-selector" ''
    WALLPAPER_DIR="$HOME/Pictures"
    MONITOR=$(hyprctl monitors | awk '/Monitor/ {print $2}')

    # Verify that the wallpaper directory exists
    if [ ! -d "$WALLPAPER_DIR" ]; then
      echo "Error: Wallpaper directory '$WALLPAPER_DIR' does not exist."
      read -n 1 -s -r -p "Press any key to exit..."
      exit 1
    fi

    # Find image files in the directory
    IMAGE_FILES=$(find "$WALLPAPER_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' \))
    if [ -z "$IMAGE_FILES" ]; then
      echo "Error: No images found in the directory '$WALLPAPER_DIR'."
      read -n 1 -s -r -p "Press any key to exit..."
      exit 1
    fi

    # Select an image using fzf
    SELECTED_IMAGE=$(echo "$IMAGE_FILES" | fzf --no-border --preview "${pkgs.chafa}/bin/chafa --clear --size=40x20 {}")
    if [ -z "$SELECTED_IMAGE" ]; then
      exit 0
    fi

    # Save the selected image path to the cache
    CACHE_FILE="$HOME/.cache/.active_wallpaper"
    echo "$SELECTED_IMAGE" > "$CACHE_FILE"

    # Set the selected image as wallpaper
    hyprctl hyprpaper unload all > /dev/null 2>&1
    hyprctl hyprpaper preload "$SELECTED_IMAGE" > /dev/null 2>&1
    hyprctl hyprpaper wallpaper "$MONITOR, $SELECTED_IMAGE" > /dev/null 2>&1

    exit 0
  '';
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ wallpaper-selector ];
  };
}
