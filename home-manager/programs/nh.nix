{
  config,
  lib,
  ...
}: let
  cfg = config.modules.programs.nh;
in {
  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      flake = config.settings.system.configDirectory;
      clean.enable = false;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
