{
  pkgs,
  config,
  ...
}: {
  services.xserver = {
    enable = true;
    xkb = {
      layout = config.settings.system.keyboardLayout;
      variant = "";
    };
    excludePackages = [pkgs.xterm];
  };

  services = {
    libinput.enable = true;
    acpid.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;

    dbus.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;
    udisks2.enable = true;
  };
}
