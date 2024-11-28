{
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;

    dbus.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;
    udisks2.enable = false; # usb auto mounting
  };
}
