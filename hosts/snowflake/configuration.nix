{...}: {
  imports = [
    ../../nixos/configuration.nix
    ./hardware-configuration.nix
    ./settings.nix
  ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
