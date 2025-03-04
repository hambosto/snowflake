{ pkgs, ... }:
{
  systemd.user.services = {
    swww = {
      Unit = {
        Description = "SWWW: Wayland Wallpaper Daemon";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        ExecStop = "${pkgs.swww}/bin/swww kill";
        Restart = "on-failure";
      };
    };
    swww-update = {
      Unit = {
        Description = "Set Default Wallpaper for Wayland";
        Requires = [ "swww.service" ];
        After = [ "swww.service" ];
        PartOf = [ "swww.service" ];
      };
      Install.WantedBy = [ "swww.service" ];
      Service = {
        ExecStart = "${pkgs.swww}/bin/swww img ${toString ../../img/rog-animated.gif} --transition-type random";
        Restart = "on-failure";
        Type = "oneshot";
      };
    };
  };
}
