{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.git;
in
{
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = config.settings.git.username;
      userEmail = config.settings.git.email;
    };
  };
}
