{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.fastfetch;
in
{
  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

        logo = {
          source = "nixos_old_small";
        };

        display = {
          separator = "  ";
          color = {
            keys = "magenta";
          };
          size = {
            ndigits = 0;
            maxPrefix = "MB";
          };
          key = {
            type = "icon";
          };
        };

        modules = [
          {
            type = "title";
            color = {
              user = "green";
              at = "red";
              host = "blue";
            };
          }
          "os"
          "kernel"
          "memory"
          "packages"
          "uptime"
          "disk"
          {
            type = "colors";
            key = "Colors";
            block = {
              range = [
                1
                6
              ];
            };
          }
        ];
      };
    };
  };
}
