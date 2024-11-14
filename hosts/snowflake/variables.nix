{config, ...}: {
  # Import external configuration for variables
  imports = [../../nixos/variables-config.nix];

  config.var = {
    # System Settings
    system = {
      hostname = "snowflake"; # Hostname of the system
      username = "ilham"; # Default username
      configDirectory = "/home/${config.var.system.username}/.config/snowflake"; # Config directory
      location = "Jakarta"; # Geographical location
      timeZone = "Asia/Jakarta"; # System timezone
      defaultLocale = "en_US.UTF-8"; # Default locale
      extraLocale = "id_ID.UTF-8"; # Additional locale
      keyboardLayout = "us"; # Keyboard layout (e.g., "us")
    };

    # Git Settings
    git = {
      username = "Ilham Putra Husada"; # Git username
      email = "hambosto@gmail.com"; # Git email
    };

    # Update and Maintenance
    maintenance = {
      autoUpgrade = false; # Disable automatic upgrades
      autoGarbageCollector = false; # Disable auto garbage collection
    };

    # Appearance
    appearance = {
      wallpaper = ../../wallpapers/retro.png; # Default wallpaper
      window = {
        rounding = 15; # Window corner rounding radius
        gaps = {
          inner = 1; # Inner window gap
          outer = 1; # Outer screen gap
        };
        opacity = {
          active = 1; # Opacity of active windows (1 = fully opaque)
          inactive = 1; # Opacity of inactive windows (1 = fully opaque)
        };
        borderSize = 3; # Window border size
        blurEnabled = true; # Enable window blur effect
        animationSpeed = "medium"; # Animation speed ("fast", "medium", "slow")
      };

      # Status Bar Settings
      bar = {
        position = "top"; # Position ("top" or "bottom")
        transparency = {
          enabled = true; # Enable transparency for the bar
          buttonsTransparent = false; # No transparency for buttons
        };
        floating = true; # Floating status bar
      };
    };
  };
}
