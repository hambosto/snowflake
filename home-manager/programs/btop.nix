{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.btop;
in
{
  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = lib.mkForce "TTY";
        theme_background = false;
      };
    };
  };
}
