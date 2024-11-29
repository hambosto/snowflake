{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  wallpaper-selector = pkgs.writeShellScriptBin "wallpaper-selector" ''
    directory="/home/${username}/Pictures"
    monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

    # Check if the directory exists
    if [ ! -d "$directory" ]; then
        echo "Error: Directory $directory does not exist."
        exit 1
    fi

    # Find images in the directory
    image_files=$(find "$directory" -type f \( -iname '*.png' -o -iname '*.jpg' \))

    # Check if no images were found
    if [ -z "$image_files" ]; then
        echo "Error: No images found in directory $directory."
        exit 1
    fi

    # Select an image using fzf
    selected_image=$(echo "$image_files" | fzf --no-border --preview "${pkgs.chafa}/bin/chafa --clear --size=40x20 {}")

    # If no image is selected, exit
    if [ -z "$selected_image" ]; then
        echo "No image selected. Exiting."
        exit 0
    fi

    # Set the selected image as wallpaper
    hyprctl hyprpaper unload all > /dev/null 2>&1
    hyprctl hyprpaper preload "$selected_image" > /dev/null 2>&1
    hyprctl hyprpaper wallpaper "$monitor, $selected_image" > /dev/null 2>&1

    exit 0
  '';
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ wallpaper-selector ];
  };
}
