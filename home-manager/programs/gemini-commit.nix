{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.gemini-commit;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.buildGoModule rec {
        pname = "geminicommit";
        version = "0.2.6";
        src = pkgs.fetchFromGitHub {
          owner = "tfkhdyt";
          repo = "geminicommit";
          rev = "v${version}";
          hash = "sha256-7LZUfipJi6gR2zHSv9HoVvSSd+QWKnY0wn3US3vAifA=";
        };
        vendorHash = "sha256-+eKJLXgKuUHelUjD8MpMa+cRP+clmYK+1olcb/jmabk=";

        env.CGO_ENABLED = 0;

        ldflags = [
          "-extldflags '-static'"
          "-s -w"
        ];

        meta = with lib; {
          description = "A CLI that writes your git commit messages for you with Google Gemini AI";
          homepage = "https://github.com/tfkhdyt/geminicommit";
          license = licenses.gpl3Only;
          maintainers = [ maintainers.tfkhdyt ];
          platforms = platforms.all;
        };
      })
    ];
  };
}
