{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.hyprpanel.overlay
      inputs.nix-vscode-extensions.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
