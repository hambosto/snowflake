{
  pkgs,
  config,
  ...
}: {
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "0a0b1a"; # Default Background - Deep Space Black
      base01 = "141526"; # Lighter Background - Midnight Core
      base02 = "1e1f35"; # Selection Background - Deep Navy
      base03 = "2b2d4d"; # Comments - Twilight Purple
      base04 = "4d4f7f"; # Dark Foreground - Mystic Violet
      base05 = "f8e2ff"; # Default Foreground - Cotton Candy White
      base06 = "ffd6f3"; # Light Foreground - Bubble Gum Pink
      base07 = "ffebf9"; # Light Background - Sweet Pink
      base08 = "ff3c7c"; # Variables - Hot Pink
      base09 = "ff5d4d"; # Integers - Cyber Red
      base0A = "ffcc00"; # Classes - Electric Yellow
      base0B = "00ff9f"; # Strings - Neon Green
      base0C = "00ffff"; # Support - Cyber Cyan
      base0D = "3c95ff"; # Functions - Bright Blue
      base0E = "f54fff"; # Keywords - Sugar Purple
      base0F = "ff6e9c"; # Deprecated - Strawberry Pink
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
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
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