{ lib, ... }:
{
  programs.zed-editor = {
    enable = false;
    userSettings = {
      theme = lib.mkForce "Tokyo Night";
      ui_font_size = lib.mkForce 18;
      ui_font_family = lib.mkForce "JetBrainsMono Nerd Font";
      buffer_font_size = lib.mkForce 14;
      buffer_font_family = lib.mkForce "JetBrainsMono Nerd Font";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

    };
    extensions = [ "tokyo-night" ];

  };
}
