{
  lib,
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun";
      font = "JetBrains Mono Regular 13";
      show-icons = true;
      terminal = "ghostty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = true;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      border-radius = 10;
    };
    theme = lib.mkForce ./rofi/theme.rasi;
  };
}
