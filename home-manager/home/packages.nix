{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nautilus
    neovim
    scrcpy
    nixd
    alejandra
    deadnix
    statix
  ];
}
