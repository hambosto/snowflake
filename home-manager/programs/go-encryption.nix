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
      (pkgs.buildGoModule {
        pname = "go-encryption";
        version = "1.0";
        src = pkgs.fetchFromGitHub {
          owner = "hambosto";
          repo = "go-encryption";
          rev = "6aa4321f60123c494650e01e5ee069d660b29f2a";
          hash = "sha256-XMzTqeFDqLkZ0qHuJOlkSGWW8oZGkaieiz6abQ5SCE8=";
        };
        vendorHash = "sha256-HrwA8L4AOUYi39i34T1gdF7SgDvbpxLECu9AWJjewu4=";

        env.CGO_ENABLED = 0;

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
