{
  config,
  lib,
  pkgs,
  ...
}:
let
  wallpaper-selector = pkgs.writeShellScriptBin "wallpaper-selector" ''
    WALLPAPER_DIR="$HOME/Pictures"
    CACHE_FILE="$HOME/.cache/.active_wallpaper"

    # Detect all monitors using hyprctl and jq
    MONITORS=$(hyprctl -j monitors | ${pkgs.jq}/bin/jq -r '.[].name')

    # Verify that the wallpaper directory exists
    if [ ! -d "$WALLPAPER_DIR" ]; then
        echo "Error: Wallpaper directory '$WALLPAPER_DIR' does not exist."
        read -n 1 -s -r -p "Press any key to exit..."
        exit 1
    fi

    # Find image files in the directory
    IMAGE_FILES=$(find "$WALLPAPER_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) ! -path "$WALLPAPER_DIR/Screenshots/*")
    if [ -z "$IMAGE_FILES" ]; then
        echo "Error: No images found in the directory '$WALLPAPER_DIR'."
        read -n 1 -s -r -p "Press any key to exit..."
        exit 1
    fi

    # Select an image using fzf with an external image viewer preview
    SELECTED_IMAGE=$(echo "$IMAGE_FILES" | ${pkgs.fzf}/bin/fzf \
        --no-border \
        --preview "${pkgs.kitty}/bin/kitten icat --clear --transfer-mode=memory --stdin=no --place=40x15@50x2 {} > /dev/tty" \
        --preview-window=right,50% \
        --preview-label="Preview" \
        --bind "ctrl-p:toggle-preview" \
        --bind "ctrl-c:cancel")

    if [ -z "$SELECTED_IMAGE" ]; then
        exit 0
    fi

    # Save the selected image path to the cache
    echo "$SELECTED_IMAGE" > "$CACHE_FILE"

    # Apply the wallpaper to all monitors
    hyprctl hyprpaper unload all > /dev/null 2>&1
    hyprctl hyprpaper preload "$SELECTED_IMAGE" > /dev/null 2>&1

    for monitor in $MONITORS; do
        hyprctl hyprpaper wallpaper "$monitor, $SELECTED_IMAGE" > /dev/null 2>&1
    done

    exit 0
  '';

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
    home.packages = [
      wallpaper-selector
      close-active-windows
    ];
  };
}
