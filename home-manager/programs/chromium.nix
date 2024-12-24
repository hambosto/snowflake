{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.chromium;
in
{
  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      commandLineArgs = [
        "--ozone-platform-hint=wayland"
        "--enable-features=UseOzonePlatform"
      ];
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      ];
    };
  };
}
