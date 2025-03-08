{
  config,
  lib,
  pkgs,
  ...
}:
let
  go-encryption =
    with lib;
    let
      cfg = config.programs.go-encryption;
      go-encryption-module = pkgs.buildGoModule {
        pname = "go-encryption";
        version = "1.0";
        src = pkgs.fetchFromGitHub {
          owner = "hambosto";
          repo = "go-encryption";
          rev = "a10bc53a039bc9eeb982a7fa894d409b3beed892";
          hash = "sha256-tfzJOEOycXtwtvF7XdYLVsUA7jiqsFHgUKzZY1OhhEs=";
        };
        vendorHash = "sha256-nxRo/spwxVE+B41znEJEWuHozxJ6dc/BAAFRU5TIYuk=";

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
      };
    in
    {
      options.programs.go-encryption = {
        enable = mkEnableOption "Enable the go-encryption program";

        package = mkOption {
          type = types.package;
          default = go-encryption-module;
          description = "The go-encryption package to use.";
        };
      };

      config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
      };
    };
in
{
  imports = [ go-encryption ];

  programs.go-encryption = {
    enable = false;
  };
}
