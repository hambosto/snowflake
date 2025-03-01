{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
      # inputs.yazi.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
