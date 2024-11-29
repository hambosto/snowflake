{
  pkgs,
  config,
  ...
}:
{
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "0a0b1a"; # Default Background - Deep Space Black
      base01 = "141526"; # Lighter Background - Midnight Core
      base02 = "1e2137"; # Selection Background - Midnight Azure
      base03 = "2d3154"; # Comments - Royal Indigo
      base04 = "4a4f7c"; # Dark Foreground - Dusty Purple
      base05 = "eef1ff"; # Default Foreground - Ice White
      base06 = "ffd7eb"; # Light Foreground - Rose Mist
      base07 = "c3e8ff"; # Light Background - Crystal Blue
      base08 = "ff5d8f"; # Variables - Electric Pink
      base09 = "ff9c55"; # Integers - Sunset Orange
      base0A = "ffcb5c"; # Classes - Golden Ray
      base0B = "46f9b8"; # Strings - Neon Mint
      base0C = "50e5ff"; # Support - Electric Blue
      base0D = "7c4dff"; # Functions - Deep Purple
      base0E = "da6dff"; # Keywords - Bright Violet
      base0F = "ff8ab7"; # Deprecated - Soft Rose
    };

    polarity = "dark";
    image = config.settings.wallpaper;

    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };
  };
}
