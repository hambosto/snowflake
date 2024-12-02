{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.bun;
in
{
  config = lib.mkIf cfg.enable {
    programs.bun = {
      enable = true;
      settings = {
        telemetry = false;
      };
    };
  };
}
