{ lib, ... }:
{
  imports = [
    ./gtk
    ./home
    ./nixpkgs
    ./programs
    ./qt
    ./scripts
    ./services
    ./wayland
  ];

  options.modules = {
    wayland = {
      hyprland.enable = lib.mkEnableOption "Enable Hyprland";
      hyprlock.enable = lib.mkEnableOption "Enable Hyprlock";
      hyprpanel.enable = lib.mkEnableOption "Enable Hyprpanel";
      rofi.enable = lib.mkEnableOption "Enable Rofi";
    };

    services = {
      hypridle.enable = lib.mkEnableOption "Enable Hypridle";
    };

    programs = {
      bat.enable = lib.mkEnableOption "Enable Bat";
      btop.enable = lib.mkEnableOption "Enable Btop";
      bun.enable = lib.mkEnableOption "Enable Bun";
      cava.enable = lib.mkEnableOption "Enable Cava";
      cavalier.enable = lib.mkEnableOption "Enable Cavalier";
      chromium.enable = lib.mkEnableOption "Enable Chromium";
      eza.enable = lib.mkEnableOption "Enable Eza";
      fastfetch.enable = lib.mkEnableOption "Enable Fastfetch";
      fzf.enable = lib.mkEnableOption "Enable Fzf";
      gemini-commit.enable = lib.mkEnableOption "Enable Gemini Commit";
      ghostty.enable = lib.mkEnableOption "Enable Ghostty";
      git.enable = lib.mkEnableOption "Enable Git";
      go-encryption.enable = lib.mkEnableOption "Enable Go Encryption";
      go.enable = lib.mkEnableOption "Enable Golang";
      kitty.enable = lib.mkEnableOption "Enable Kitty";
      lazygit.enable = lib.mkEnableOption "Enable Lazygit";
      nh.enable = lib.mkEnableOption "Enable NH";
      spicetify.enable = lib.mkEnableOption "Enable Spicetify";
      vscode.enable = lib.mkEnableOption "Enable VSCode";
      yazi.enable = lib.mkEnableOption "Enable Yazi";
      zen.enable = lib.mkEnableOption "Enable Zen";
      zoxide.enable = lib.mkEnableOption "Enable Zoxide";
      zsh.enable = lib.mkEnableOption "Enable Zsh";
    };
  };
}
