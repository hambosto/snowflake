{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.go-encryption;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.buildGoModule rec {
        pname = "go-encryption";
        version = "0.0.1";
        src = pkgs.fetchFromGitHub {
          owner = "hambosto";
          repo = "go-encryption";
          rev = "v${version}";
          hash = "sha256-NUQIViWsvi1YG5yM85/yIQhfjQJQwaN0zBSLdP5PSpY=";
        };
        vendorHash = "sha256-6fKolW8dBS0R6RvKfaOPwljRRZruVN+ATi4qEkk3VXY=";
        ldflags = [
          "-s -w"
        ];
        meta = with lib; {
          description = "Secure file encryption and decryption CLI tool built with Go";
          homepage = "https://github.com/hambosto/go-encryption";
          license = licenses.mit;
          maintainers = [ maintainers.hambosto ];
          platforms = platforms.all;
        };
      })
    ];
  };
}
