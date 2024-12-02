{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.bat;
in
{
  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
    };
  };
}
