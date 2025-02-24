{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.ghostty;
in
{
  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        background-opacity = lib.mkForce 0.4;
        font-family = "ComicShannsMono Nerd Font";
        font-size = 12;
      };
    };
  };
}
