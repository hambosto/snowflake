{ pkgs, ... }:
{
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
