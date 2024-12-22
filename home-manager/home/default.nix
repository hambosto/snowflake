{
  username,
  pkgs,
  ...
}:
{
  # Import user-defined modules for additional options and settings
  imports = [
    ./../../modules/options
    ./../../modules/settings
  ];

  # Configure home directory and user-specific settings
  home = {
    username = "${username}"; # The username of the user
    homeDirectory = "/home/${username}";
    stateVersion = "24.05"; # Specify the state version for compatibility

    # Add a profile picture in the home directory
    file.".profile_picture.jpg".source = ./profile_picture.jpg;

    # List of packages to install in the user's environment
    packages = with pkgs; [
      neovim
      # python3
      # python3Packages.pip
      # rust-bin.stable.latest.default
    ];
  };

  # Enable Home Manager for user-specific configuration management
  programs.home-manager.enable = true;

  modules = {
    # Wayland-specific modules and settings
    wayland = {
      hyprland.enable = true; # Enable Hyprland Wayland compositor
      hyprlock.enable = true; # Enable Hyprlock screen locker
      hyprpanel.enable = true; # Enable Hyprpanel status bar/panel
      rofi.enable = true; # Enable Rofi launcher
    };

    # Enable or disable system services
    services = {
      clipman.enable = true; # Enable clipboard manager
      hypridle.enable = true; # Enable Hyprland idle manager
      udiskie.enable = false; # Enable automatic disk mounting
    };

    # Enable or configure additional programs
    programs = {
      bat.enable = true; # Enable bat (cat alternative with syntax highlighting)
      btop.enable = true; # Enable btop (resource monitor)
      bun.enable = true; # JavaScript runtime for fast builds and scripting
      cava.enable = true; # Disable CAVA audio visualizer
      eza.enable = true; # Enable eza (enhanced ls command)
      fastfetch.enable = true; # Enable fastfetch (system info tool)
      firefox.enable = true; # Enable Firefox browser
      fzf.enable = true; # Enable fzf (fuzzy finder)
      gemini-commit.enable = true; # Enable Gemini Commit (version control)
      git.enable = true; # Enable Git (version control)
      go-encryption.enable = true; # Enable Go encryption utility
      go.enable = true; # Enable Go programming language
      kitty.enable = true; # Enable Kitty terminal emulator
      lazygit.enable = true; # Enable Lazygit (Git UI)
      nh.enable = true; # Enable NH (tool for something specific)
      spicetify.enable = true; # Enable Spicetify (Spotify theming)
      vscode.enable = true; # Enable Visual Studio Code editor
      yazi.enable = true; # Enable Yazi (file manager)
      zen.enable = true; # Enable Zen (Oh My Posh with Zen theme)
      zoxide.enable = true; # Enable Zoxide (directory jumper)
      zsh.enable = true; # Enable Zsh shell
    };
  };
}
