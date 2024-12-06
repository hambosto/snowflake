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

        logo = {
          source = "linux-generic";
        };

        display = {
          separator = "  ";
          color = {
            keys = "magenta";
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
          "cpu"
          "memory"
          "disk"
          {
            "type" = "localip";
            "format" = "{ipv4} ({ifname})";
          }
          "uptime"
          "shell"
          "packages"
          "terminal"
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
