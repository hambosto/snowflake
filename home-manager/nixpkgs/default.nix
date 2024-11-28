{ inputs, ... }:
{
  nixpkgs = {
    # You can add overlays here
    overlays = [
      inputs.hyprpanel.overlay
    ];
    # Configure your nixpkgs instance
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
