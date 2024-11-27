{lib, ...}: {
  imports = [
    ./gtk
    ./home
    ./nixpkgs
    ./programs
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
      wlogout.enable = lib.mkEnableOption "Enable Wlogout";
    };

    services = {
      clipman.enable = lib.mkEnableOption "Enable Clipman";
      hypridle.enable = lib.mkEnableOption "Enable Hypridle";
      udiskie.enable = lib.mkEnableOption "Enable Udiskie";
    };

    programs = {
      btop.enable = lib.mkEnableOption "Enable Btop";
      cava.enable = lib.mkEnableOption "Enable Cava";
      eza.enable = lib.mkEnableOption "Enable Eza";
      fastfetch.enable = lib.mkEnableOption "Enable Fastfetch";
      firefox.enable = lib.mkEnableOption "Enable Firefox";
      fzf.enable = lib.mkEnableOption "Enable Fzf";
      gemini-commit.enable = lib.mkEnableOption "Enable Gemini Commit";
      git.enable = lib.mkEnableOption "Enable Git";
      go-encryption.enable = lib.mkEnableOption "Enable Go Encryption";
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
