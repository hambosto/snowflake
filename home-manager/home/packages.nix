{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    neovim
    nixd
    alejandra
    deadnix
    statix
  ];
}
