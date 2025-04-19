{
  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise.automatic = true;

    settings = {
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      extra-substituters = [ "https://helix.cachix.org" ];
      extra-trusted-public-keys = [ "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs=" ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      max-jobs = "auto";
      substituters = [ ];
      trusted-public-keys = [ ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
  };
}
