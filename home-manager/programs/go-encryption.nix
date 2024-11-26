{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.programs.go-encryption;
in {
  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.buildGoModule rec {
        pname = "go-encryption";
        version = "1.0.1";
        src = pkgs.fetchFromGitHub {
          owner = "hambosto";
          repo = "go-encryption";
          rev = "v${version}";
          hash = "sha256-D6RV4c+Tk3DRpU1lOoJLXu5Xe5H6tMKHDGav1sFykWg=";
        };
        vendorHash = "sha256-4nwKIyWExckaR28ksjpZy+6u5XDWivixxMrJca4KeGw=";
        ldflags = [
          "-s -w"
        ];
        meta = with lib; {
          description = "Secure file encryption and decryption CLI tool built with Go";
          homepage = "https://github.com/hambosto/go-encryption";
          license = licenses.mit;
          maintainers = [maintainers.hambosto];
          platforms = platforms.all;
        };
      })
    ];
  };
}
