{
  config,
  lib,
  ...
}: let
  cfg = config.modules.programs.git;
in {
  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      settings = lib.mkForce {
        gui = {
          theme = {
            activeBorderColor = ["#${config.lib.stylix.colors.base0D}" "bold"];
            inactiveBorderColor = ["#${config.lib.stylix.colors.base03}"];
          };
          showListFooter = false;
          showRandomTip = false;
          showCommandLog = false;
          showBottomLine = false;
          nerdFontsVersion = "3";
        };
      };
    };
  };
}
