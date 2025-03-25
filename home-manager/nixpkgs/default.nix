{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
      inputs.rust-overlay.overlays.default
      inputs.nur.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
