{ pkgs, inputs, config, ... }: {
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "0d0f1e"; # Default Background - Deep Space Blue
      base01 = "151729"; # Lighter Background - Twilight Navy
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
    image = config.var.appearance.wallpaper;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrains Mono Nerd Font";
      };
      sansSerif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
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
