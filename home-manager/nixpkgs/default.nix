{ inputs, ... }:
{
  nixpkgs = {
    # You can add overlays here
    overlays = [
      inputs.hyprpanel.overlay
      (self: super: {
        gnome = super.gnome // {
          gnome-bluetooth = super.pkgs.gnome-bluetooth;
          gnome-bluetooth_1_0 = super.pkgs.gnome-bluetooth_1_0;
        };
      })
    ];
    # Configure your nixpkgs instance
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
