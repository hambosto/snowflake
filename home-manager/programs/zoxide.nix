{
  config,
  lib,
  ...
}: let
  cfg = config.modules.programs.zoxide;
in {
  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
