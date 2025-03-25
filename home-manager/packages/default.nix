{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    # zig

    peaclock
    cbonsai
    pipes
    cmatrix
  ];
}
