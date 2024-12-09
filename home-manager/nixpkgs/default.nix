{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.hyprpanel.overlay
      inputs.nix-vscode-extensions.overlays.default
      inputs.nur.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
