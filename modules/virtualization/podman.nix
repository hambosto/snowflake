{
  config,
  lib,
  ...
}:
let
  cfg = config.settings.virtualization.podman;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
