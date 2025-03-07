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
          rev = "44c1a8b3fe994bcfdd327e4cf2af69a3e94ce591";
          hash = "sha256-JSt9ypziXs80+yymg+LqqSB+7+4GoQ5TNJeAnRSKGvo=";
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
