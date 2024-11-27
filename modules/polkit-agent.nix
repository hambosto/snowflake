{pkgs, ...}: {
  systemd.user.services.polkit-agent = {
    description = "Polkit GNOME Authentication Agent";
    wants = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];
    after = ["graphical-session.target"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
