{ pkgs, config, ... }: {

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/nvim
    ../../home/programs/shell
    ../../home/programs/fastfetch
    ../../home/programs/git
    ../../home/programs/yazi
    ../../home/programs/btop
    ../../home/programs/lazygit
    ../../home/programs/nh
    ../../home/programs/cava
    ../../home/programs/vscode
    ../../home/programs/firefox
    ../../home/programs/development
    # ../../home/programs/docker
    # ../../home/programs/kvm

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/gtk
    ../../home/system/batsignal
    # ../../home/system/udiskie
    ../../home/system/clipman
    ../../home/system/rofi

  ];

  stylix.targets.vscode.enable = false;
  stylix.targets.rofi.enable = false;

  home = {
    homeDirectory = "/home/" + config.var.system.username;

    packages = with pkgs; [ zip unzip peaclock cbonsai pipes cmatrix ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".profile_picture.png" = { source = ./profile_pictures.jpg; };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
