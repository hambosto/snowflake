{ lib, pkgs, ... }:
{
  programs.zed-editor = {
    enable = false;
    installRemoteServer = true;
    extraPackages = [ pkgs.nixd ];
    userSettings = {
      theme = lib.mkForce "Tokyo Night";
      ui_font_size = lib.mkForce 18;
      ui_font_family = lib.mkForce "JetBrainsMono Nerd Font";
      buffer_font_size = lib.mkForce 14;
      buffer_font_family = lib.mkForce "JetBrainsMono Nerd Font";
      inlay_hints.enabled = true;

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };

    extensions = [
      "tokyo-night"
      "nix"
    ];
  };
}
