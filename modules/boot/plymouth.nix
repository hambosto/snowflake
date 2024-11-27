{
  config,
  lib,
  ...
}: let
  cfg = config.settings.plymouth;
in {
  config = lib.mkIf cfg.enable {
    boot = {
      plymouth = {
        enable = cfg.enable;
        themePackages = [cfg.themesPackage];
        theme = lib.mkForce cfg.theme;
      };
      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
      loader.timeout = 0;
    };
  };
}
