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
    # };

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/HyDE-Project/hyde-themes/Tokyo-Night/Configs/.config/hyde/themes/Tokyo%20Night/wallpapers/edger_lucy_neon.jpg";
      sha256 = "sha256-DcJlqThWgy/lR4q03KVoQyvXbHxzCWNCMo62y/x5fHQ=";
    };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/HyDE-Project/hyde-themes/Catppuccin-Mocha/Configs/.config/hyde/themes/Catppuccin%20Mocha/wallpapers/rebellious_tower.png";
    #   sha256 = "sha256-+0aBVMBVaobTwWp5/Dx5VHVwGi26SjM4+xqK/oWbyNI=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/HyDE-Project/hyde-themes/Catppuccin-Mocha/Configs/.config/hyde/themes/Catppuccin%20Mocha/wallpapers/aesthetic_deer.png";
    #   sha256 = "sha256-PAYE7IjDpUMNsZ94noVkggW3MHNHxA629omYTDtRae0=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/light-ring.jpg";
    #   sha256 = "sha256-BRgwIUqrQaut9hb94gIgtNtp9SQYFbf4lQhtQXYmahw=";
    # };

    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/SwayKh/Wallpapers/main/Images/cat_lofi_cafe.png";
    #   sha256 = "sha256-yUW052i9IrjKnv7/7rpckJJUKbvlT/WzaZl1Fw9fuqI=";
    # };

    polarity = "dark";

    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Mono";
      };

      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
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

  # stylix.targets = {
  #   chromium.enable = false;
  # };
}
