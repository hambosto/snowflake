{
  imports = [
    ./../../modules/options
    ./../../modules/settings
  ];

  modules = {
    wayland = {
      hyprland.enable = true;
      hyprlock.enable = true;
      hyprpanel.enable = true;
      anyrun.enable = true;
    };

    services = {
      hypridle.enable = true;
    };

    programs = {
      bat.enable = true;
      btop.enable = true;
      bun.enable = false;
      cava.enable = true;
      chromium.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fzf.enable = true;
      gemini-commit.enable = true;
      ghostty.enable = false;
      git.enable = true;
      go-encryption.enable = true;
      go.enable = true;
      kitty.enable = true;
      nh.enable = true;
      spicetify.enable = false;
      vscode.enable = true;
      yazi.enable = true;
      zen.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };
  };
}
