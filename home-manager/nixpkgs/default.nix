{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.hyprpanel.overlay
      inputs.nix-vscode-extensions.overlays.default
      inputs.nur.overlays.default
      # inputs.rust-overlay.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
