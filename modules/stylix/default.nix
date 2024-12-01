{
  pkgs,
  config,
  ...
}:
{
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "0a0b1a";
      base01 = "141526";
      base02 = "1e1f35";
      base03 = "2b2d4d";
      base04 = "4d4f7f";
      base05 = "f8e2ff";
      base06 = "ffd6f3";
      base07 = "ffebf9";
      base08 = "ff3c7c";
      base09 = "ff5d4d";
      base0A = "ffcc00";
      base0B = "00ff9f";
      base0C = "00ffff";
      base0D = "7c4dff";
      base0E = "f54fff";
      base0F = "ff6e9c";
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
        package = pkgs.nerd-fonts.jetbrains-mono;
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
