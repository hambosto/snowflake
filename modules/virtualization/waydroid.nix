{
  config,
  lib,
  ...
}:
let
  cfg = config.settings.virtualization.waydroid;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.waydroid.enable = true;
  };
}
