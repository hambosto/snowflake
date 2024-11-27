{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./display-manager.nix
    ./fonts.nix
    ./graphics.nix
    ./hardware-configuration.nix
    ./keyboard.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./options.nix
    ./packages.nix
    ./plymouth.nix
    ./polkit-agent.nix
    ./security.nix
    ./services.nix
    ./settings.nix
    ./shell.nix
    ./stylix.nix
    ./timezone.nix
    ./users.nix
    ./xdg-portal.nix
    ./zram.nix
  ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
