{username, ...}: {
  imports = [./../../nixos/options.nix];

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

    wallpaper = ../../wallpapers/default.jpg; # default wallpapaper
  };
}
