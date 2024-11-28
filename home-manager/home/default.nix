{
  username,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/options
    ./../../modules/settings
  ];

  home = {
    # User-specific home directory settings
    username = "${username}"; # The username of the user
    homeDirectory = "/home/${username}"; # Full path to the user's home directory
    stateVersion = "24.05"; # State version, specifying the version of Home Manager being used

    # Profile picture configuration (using a local file for the user’s profile picture)
    file.".profile_picture.jpg".source = ./profile_picture.jpg; # Dashboard profile picture

    # Packages to be installed for the user, including utilities and development tools
    packages = with pkgs; [
      # Common utilities and games
      zip # Utility for compressing files into ZIP archives
      unzip # Utility for extracting files from ZIP archives
      peaclock # A peaceful clock application
      cbonsai # A Bonsai tree program in the terminal
      pipes-rs # A terminal game involving pipes
      cmatrix # Matrix-style screen saver for the terminal
      neovim # Modern text editor based on Vim

      # Development tools and programming languages
      go # Go programming language
      nodejs # Node.js runtime for JavaScript
      python3 # Python 3 interpreter
      python3Packages.pip # Python package installer (PIP)
    ];
  };

  # Enable Home Manager for managing user-specific configurations
  programs.home-manager.enable = true;

  # Configuration for different modules (Wayland, services, and programs)
  modules = {
    # Wayland and related desktop environment settings
    wayland = {
      hyprland.enable = true; # Enable Hyprland (Wayland compositor)
      hyprlock.enable = true; # Enable Hyprlock (screen locker for Wayland)
      hyprpanel.enable = true; # Enable Hyprpanel (panel for Hyprland)
      rofi.enable = true; # Enable Rofi (window switcher/application launcher)
      wlogout.enable = true; # Enable Wlogout (Wayland logout tool)
    };

    # Service settings, enabling or disabling specific background services
    services = {
      clipman.enable = true; # Enable Clipman (clipboard manager)
      hypridle.enable = true; # Enable Hypridle (idle detection for Hyprland)
      udiskie.enable = false; # Enavle Udiskie (automounting for USB drives)
    };

    # Programs and utilities configuration, enabling or disabling various software
    programs = {
      btop.enable = true; # Enable btop (system monitoring tool)
      cava.enable = false; # Enable Cava (audio visualizer for the terminal)
      eza.enable = true; # Enable eza (modern replacement for `ls`)
      fastfetch.enable = true; # Enable fastfetch (information fetching utility)
      firefox.enable = true; # Enable Firefox (web browser)
      fzf.enable = true; # Enable fzf (fuzzy finder for the terminal)
      gemini-commit.enable = true; # Enable Gemini commit (Git commit utility)
      git.enable = true; # Enable Git (version control system)
      go-encryption.enable = true; # Enable Go encryption tools
      kitty.enable = true; # Enable Kitty (fast terminal emulator)
      lazygit.enable = true; # Enable Lazygit (terminal UI for Git)
      nh.enable = true; # Enable nh (news aggregator)
      spicetify.enable = true; # Enable Spicetify (Spotify customization)
      vscode.enable = true; # Enable VSCode (code editor)
      yazi.enable = true; # Enable Yazi (terminal-based file manager)
      zen.enable = true; # Enable Zen (minimalist application launcher)
      zoxide.enable = true; # Enable Zoxide (fast directory navigation)
      zsh.enable = true; # Enable Zsh (shell with advanced features)
    };
  };
}
