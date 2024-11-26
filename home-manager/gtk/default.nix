{pkgs, ...}: {
  stylix.targets.gtk.enable = false;

  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.whitesur-gtk-theme;
      name = "WhiteSur-Dark";
    };

    iconTheme = {
      package = pkgs.kora-icon-theme;
      name = "Kora";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
