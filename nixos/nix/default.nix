{
  nix = {
    settings = {
      auto-optimise-store = true;
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ ];
      trusted-public-keys = [ ];
      extra-substituters = [ ];
      extra-trusted-public-keys = [ ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
  };
}
