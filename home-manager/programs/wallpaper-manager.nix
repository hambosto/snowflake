{ inputs, ... }:
{
  imports = [ inputs.wallpaper-manager.homeManagerModules.default ];

  programs.wallpaper-manager.enable = true;
  # programs.wallpaper-manager.hyprland.enable = true;
}
