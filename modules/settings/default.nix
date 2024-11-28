# User configuration settings, including system preferences, git, virtualization, and other settings.
{ username, ... }:
{
  settings = {
    # System configuration details, including user-specific information and locales.
    system = {
      # Full name of the user, often used in system identification or documentation
      fullName = "Ilham Putra Husada";

      # Directory path for user-specific configuration files (e.g., applications and settings)
      configDirectory = "/home/${username}/.config/snowflake";

      # Physical location of the user (city or region, can be used for localized settings)
      location = "Tirtoyudo";

      # Time zone configuration for the user, ensuring the correct local time
      timeZone = "Asia/Jakarta";

      # Default system locale, which defines the language and region (English - US)
      defaultLocale = "en_US.UTF-8";

      # Extra locale for supporting Indonesian language (id_ID locale)
      extraLocale = "id_ID.UTF-8";

      # Keyboard layout configuration (US QWERTY layout in this case)
      keyboardLayout = "us";
    };

    # Git configuration settings, defining the username and email used for git commits
    git = {
      # Git username used for commit history identification
      username = "Ilham Putra Husada";

      # Git email address for associating commits with a specific email
      email = "hambosto@gmail.com";
    };

    # Virtualization settings, in this case, Podman (a containerization tool) is disabled
    virtualization = {
      # Enable Podman container platform
      podman.enable = false;
    };

    # Plymouth settings for controlling the boot splash screen theme and enabling/disabling it
    # The theme is based on the Plymouth themes repository: https://github.com/adi1090x/plymouth-themes
    plymouth = {
      # Enable the Plymouth boot splash screen
      enable = true;

      # Set the Plymouth theme to "rog" for a custom graphical splash screen
      theme = "rog";
    };

    # Wallpaper setting that points to the default wallpaper image file path
    wallpaper = ../../wallpapers/default.jpg; # Path to the default wallpaper image
  };
}
