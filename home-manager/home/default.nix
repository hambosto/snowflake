{
  username,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/options.nix
    ./../../modules/settings.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";

    file.".profile_picture.jpg".source = ./profile_picture.jpg; # dashboard profile picture

    packages = with pkgs; [
      zip
      unzip
      peaclock
      cbonsai
      pipes-rs
      cmatrix
      neovim

      go
      nodejs
      python3
      python3Packages.pip
    ];
  };

  programs.home-manager.enable = true;

  modules = {
    wayland = {
      hyprland.enable = true;
      hyprlock.enable = true;
      hyprpanel.enable = true;
      rofi.enable = true;
      wlogout.enable = true;
    };

    services = {
      clipman.enable = true;
      hypridle.enable = true;
      udiskie.enable = false;
    };

    programs = {
      btop.enable = true;
      cava.enable = false;
      eza.enable = true;
      fastfetch.enable = true;
      firefox.enable = true;
      fzf.enable = true;
      gemini-commit.enable = true;
      git.enable = true;
      go-encryption.enable = true;
      kitty.enable = true;
      lazygit.enable = true;
      nh.enable = true;
      spicetify.enable = true;
      vscode.enable = true;
      yazi.enable = true;
      zen.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}
