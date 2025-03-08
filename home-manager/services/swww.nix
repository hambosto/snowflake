{ pkgs, ... }:
let
  selected_wallpaper = ../../wallpapers/rog-animated.gif;
in
{
  systemd.user.services = {
    swww = {
      Unit = {
        Description = "Wayland Wallpaper Daemon";
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
    wallpaper = {
      Unit = {
        Description = "Set Default Wallpaper for Wayland";
        Requires = [ "swww.service" ];
        After = [ "swww.service" ];
        PartOf = [ "swww.service" ];
      };
      Install.WantedBy = [ "swww.service" ];
      Service = {
        ExecStart = "${pkgs.swww}/bin/swww img ${selected_wallpaper} --transition-type random";
        # ExecStartPre = "${pkgs.coreutils}/bin/sleep 1";
        Restart = "on-failure";
        Type = "oneshot";
      };
    };
  };
}
