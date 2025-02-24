{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    obsidian
    nodejs
    vlc
  ];
}
