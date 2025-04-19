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
      extra-substituters = [ ];
      extra-trusted-public-keys = [ ];

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
