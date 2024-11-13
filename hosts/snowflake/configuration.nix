{ config, pkgs, ... }: {
  imports = [

    ../../nixos/audio.nix
    ../../nixos/auto-upgrade.nix
    # ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/network-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/timezone.nix
    ../../nixos/tuigreet.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/xdg-portal.nix
    ../../nixos/variables-config.nix
    ../../nixos/stylix.nix

    ./hardware-configuration.nix
    ./variables.nix
  ];

  services.xserver.excludePackages = with pkgs; [ xterm ];

  home-manager.users."${config.var.system.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = "24.05";
}
