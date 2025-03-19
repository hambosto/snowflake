{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs

    peaclock
    cbonsai
    pipes
    cmatrix
    eog
    nautilus
    gnome-disk-utility
  ];
}
