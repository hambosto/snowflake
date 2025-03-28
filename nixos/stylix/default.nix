{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    # base16Scheme = {
    #   base00 = "0a0b1a"; # Default Background - Deep Space Black
    #   base01 = "141526"; # Lighter Background - Midnight Core
    #   base02 = "1e1f35"; # Selection Background - Deep Navy
    #   base03 = "2b2d4d"; # Comments - Twilight Purple
    #   base04 = "4d4f7f"; # Dark Foreground - Mystic Violet
    #   base05 = "f8e2ff"; # Default Foreground - Cotton Candy White
    #   base06 = "ffd6f3"; # Light Foreground - Bubble Gum Pink
    #   base07 = "ffebf9"; # Light Background - Sweet Pink
    #   base08 = "ff3c7c"; # Variables - Hot Pink
    #   base09 = "ff5d4d"; # Integers - Cyber Red
    #   base0A = "ffcc00"; # Classes - Electric Yellow
    #   base0B = "00ff9f"; # Strings - Neon Green
    #   base0C = "00ffff"; # Support - Cyber Cyan
    #   base0D = "7c4dff"; # Functions - Deep Purple
    #   base0E = "f54fff"; # Keywords - Sugar Purple
    #   base0F = "ff6e9c"; # Deprecated - Strawberry Pink

    #   base00 = "#282a36";
    #   base01 = "#363447";
    #   base02 = "#44475a";
    #   base03 = "#6272a4";
    #   base04 = "#9ea8c7";
    #   base05 = "#f8f8f2";
    #   base06 = "#f0f1f4";
    #   base07 = "#ffffff";
    #   base08 = "#ff5555";
    #   base09 = "#ffb86c";
    #   base0A = "#f1fa8c";
    #   base0B = "#50fa7b";
    #   base0C = "#8be9fd";
    #   base0D = "#80bfff";
    #   base0E = "#ff79c6";
    #   base0F = "#bd93f9";
    # };

    base16Scheme = {
      base00 = "232136";
      base01 = "2a273f";
      base02 = "393552";
      base03 = "6e6a86";
      base04 = "908caa";
      base05 = "e0def4";
      base06 = "e0def4";
      base07 = "56526e";
      base08 = "eb6f92";
      base09 = "f6c177";
      base0A = "ea9a97";
      base0B = "3e8fb0";
      base0C = "9ccfd8";
      base0D = "c4a7e7";
      base0E = "f6c177";
      base0F = "56526e";
    };

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/alokinho1/hyprpine-dots/main/Wallpaper/Wallpaper_woods_upscayl_4x_RealESRGAN_General_x4_v3.png";
      sha256 = "sha256-cWixfeuwlyqXZ+XQ16TJoBuRNT3cMbhOBpziAn++H2Y=";
    };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/light-ring.jpg";
    #   sha256 = "sha256-BRgwIUqrQaut9hb94gIgtNtp9SQYFbf4lQhtQXYmahw=";
    # };

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.source-sans-pro;
        name = "Source Sans Pro";
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

  stylix.targets = {
    chromium.enable = false;
  };
}
