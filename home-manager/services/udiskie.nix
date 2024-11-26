{
  config,
  lib,
  ...
}: let
  cfg = config.modules.services.udiskie;
in {
  config = lib.mkIf cfg.enable {
    services.udiskie = {
      enable = true;
      notify = true;
      automount = true;
    };
  };
}
