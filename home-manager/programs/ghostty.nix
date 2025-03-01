{
  config,
  lib,
  # inputs,
  ...
}:
let
  cfg = config.modules.programs.ghostty;
in
{
  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      # package = inputs.ghostty.packages.x86_64-linux.default;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        background-opacity = lib.mkForce 0.4;
        background-blur = 10;
        font-family = "ComicShannsMono Nerd Font";
        font-size = 12;
        window-width = 950;
        window-height = 500;
        cursor-style-blink = true;
        copy-on-select = true;
        confirm-close-surface = false;
        font-synthetic-style = true;
        font-thicken = false;
        bold-is-bright = false;
        adjust-box-thickness = 1;
        cursor-style = "bar";
        adjust-cursor-thickness = 1;
        mouse-hide-while-typing = true;
        window-padding-x = 4;
        window-padding-y = 6;
        window-padding-balance = true;
        gtk-single-instance = true;
      };
    };
  };
}
