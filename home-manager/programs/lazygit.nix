{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.lazygit;
in
{
  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      settings = {
        showListFooter = false;
        showRandomTip = false;
        showCommandLog = false;
        showBottomLine = false;
        nerdFontsVersion = "3";
      };
    };
  };
}
