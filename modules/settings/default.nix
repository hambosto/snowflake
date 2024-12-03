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

    # Plymouth configuration
    # The theme is based on the Plymouth themes repository: https://github.com/adi1090x/plymouth-themes
    plymouth = {
      enable = true;
      theme = "rog_2";
    };

    # Wallpaper path
    wallpaper = ../../wallpapers/default.jpg;
  };
}
