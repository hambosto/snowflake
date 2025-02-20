{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nautilus
    neovim
    obsidian
    nodejs
  ];
}
