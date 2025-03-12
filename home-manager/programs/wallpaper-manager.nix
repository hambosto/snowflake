{ inputs, ... }:
{
  imports = [ inputs.wallpaper-manager.nixosModules.default ];

  programs.wallpaper-manager.enable = true;
}
