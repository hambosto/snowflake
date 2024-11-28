{ inputs, ... }:
{
  nixpkgs = {
    # You can add overlays here
    overlays = [
      inputs.hyprpanel.overlay
      inputs.nix-vscode-extensions.overlays.default
    ];
    # Configure your nixpkgs instance
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
