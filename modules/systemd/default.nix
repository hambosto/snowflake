{
  imports = [
    ./greetd.nix
    ./polkit-agent.nix
  ];
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
