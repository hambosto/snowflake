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
        version = "0.0.3";
        src = pkgs.fetchFromGitHub {
          owner = "hambosto";
          repo = "go-encryption";
          rev = "v${version}";
          hash = "sha256-A8OvDJ9/BsnEpxss97segCLBDBJOo9Q1hy5Tk1UKe3o=";
        };
        vendorHash = "sha256-6fKolW8dBS0R6RvKfaOPwljRRZruVN+ATi4qEkk3VXY=";

        CGO_ENABLED = 0;

        ldflags = [
          "-extldflags '-static'"
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
