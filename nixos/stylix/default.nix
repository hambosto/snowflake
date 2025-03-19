{ pkgs, ... }:
{
  stylix = {
    enable = true;

    # "base00": "051649",
    # "base01": "104394",
    # "base02": "98557e",
    # "base03": "b48fd2",
    # "base04": "c9afde",
    # "base05": "f7daec",
    # "base06": "c9fbf0",
    # "base07": "e2f3fd",
    # "base08": "8589e2",
    # "base09": "a682c8",
    # "base0A": "5d98a8",
    # "base0B": "629f59",
    # "base0C": "5092e8",
    # "base0D": "d46cb7",
    # "base0E": "8990aa",
    # "base0F": "ed5ba2",

    # base16Scheme = {
    # base00 = "0a0b1a"; # Default Background - Deep Space Black
    # base01 = "141526"; # Lighter Background - Midnight Core
    # base02 = "1e1f35"; # Selection Background - Deep Navy
    # base03 = "2b2d4d"; # Comments - Twilight Purple
    # base04 = "4d4f7f"; # Dark Foreground - Mystic Violet
    # base05 = "f8e2ff"; # Default Foreground - Cotton Candy White
    # base06 = "ffd6f3"; # Light Foreground - Bubble Gum Pink
    # base07 = "ffebf9"; # Light Background - Sweet Pink
    # base08 = "ff3c7c"; # Variables - Hot Pink
    # base09 = "ff5d4d"; # Integers - Cyber Red
    # base0A = "ffcc00"; # Classes - Electric Yellow
    # base0B = "00ff9f"; # Strings - Neon Green
    # base0C = "00ffff"; # Support - Cyber Cyan
    # base0D = "7c4dff"; # Functions - Deep Purple
    # base0E = "f54fff"; # Keywords - Sugar Purple
    # base0F = "ff6e9c"; # Deprecated - Strawberry Pink
    # };

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/light-ring.jpg";
      sha256 = "sha256-BRgwIUqrQaut9hb94gIgtNtp9SQYFbf4lQhtQXYmahw=";
    };

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.ubuntu;
        name = "Ubuntu Nerd Font";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 14;
      };
    };
  };
}
