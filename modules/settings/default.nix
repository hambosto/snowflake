{ username, ... }:
{
  settings = {
    # System configuration
    system = {
      fullName = "Ilham Putra Husada";
      configDirectory = "/home/${username}/.config/snowflake";
      location = "Tirtoyudo";
      timeZone = "Asia/Jakarta";
      defaultLocale = "en_US.UTF-8";
      extraLocale = "id_ID.UTF-8";
      keyboardLayout = "us";
    };

    # Git configuration
    git = {
      username = "Ilham Putra Husada";
      email = "hambosto@gmail.com";
    };

    # Virtualization settings
    virtualization = {
      podman.enable = false;
    };

    # Wallpaper path
    wallpaper = ../../wallpapers/default.jpg;
  };
}
