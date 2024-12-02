{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.go;
in
{
  config = lib.mkIf cfg.enable {
    programs.go = {
      enable = true;
      goPath = "go";
    };
  };
}
