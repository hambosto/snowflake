{
  config,
  lib,
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
        background-blur = true;
        font-family = "ComicShannsMono Nerd Font";
        font-size = 12;
        window-width = 950;
        window-height = 500;
        cursor-style-blink = true;
        copy-on-select = true;
        confirm-close-surface = false;
        font-synthetic-style = true;
      };
    };
  };
}
