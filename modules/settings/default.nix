{username, ...}: {
  settings = {
    system = {
      fullName = "Ilham Putra Husada";
      configDirectory = "/home/${username}/.config/snowflake";
      location = "Tirtoyudo";
      timeZone = "Asia/Jakarta";
      defaultLocale = "en_US.UTF-8";
      extraLocale = "id_ID.UTF-8";
      keyboardLayout = "us";
    };

    git = {
      username = "Ilham Putra Husada";
      email = "hambosto@gmail.com";
    };

    virtualization = {
      podman.enable = false;
    };

    # based on https://github.com/adi1090x/plymouth-themes
    plymouth = {
      enable = true;
      theme = "rog";
    };

    wallpaper = ../../wallpapers/default.jpg; # default wallpapaper
  };
}
