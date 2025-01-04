{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  cfg = config.modules.programs.spicetify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "spotify" ];

    stylix.targets.spicetify.enable = false;

    programs.spicetify = {
      enable = true;
      theme = lib.mkForce spicePkgs.themes.lucid;

      colorScheme = "dark";

      enabledExtensions = with spicePkgs.extensions; [
        playlistIcons
        lastfm
        historyShortcut
        hidePodcasts
        adblock
        fullAppDisplay
        shuffle
      ];
    };
  };
}
