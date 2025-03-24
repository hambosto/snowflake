{
  config,
  pkgs,
  ...
}:
{
  gtk = {
    enable = true;

    iconTheme = {
      package =
        if config.programs.waybar.enable then pkgs.whitesur-icon-theme else pkgs.adwaita-icon-theme;
      name = if config.programs.waybar.enable then "WhiteSur" else "Adwaita";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
