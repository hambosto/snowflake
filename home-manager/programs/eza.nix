{
  config,
  lib,
  ...
}: let
  cfg = config.modules.programs.eza;
in {
  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
      icons = "auto";

      extraOptions = [
        "--group-directories-first"
        "--no-quotes"
        "--git-ignore"
        "--icons=always"
      ];
    };
  };
}
