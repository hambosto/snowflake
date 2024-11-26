{
  config,
  pkgs,
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
}
