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
        version = "1.0";
        src = pkgs.fetchFromGitHub {
          owner = "hambosto";
          repo = "go-encryption";
          rev = "v${version}";
          hash = "sha256-zQRsXey3NSLBgcOWlcJ6J5ieYy0thxFNQCcsv+CjHhA=";
        };
        vendorHash = "sha256-670vFdRND7lAXUxhFTgqdjZOG0Zaww6CET8dehcCq/c=";

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
