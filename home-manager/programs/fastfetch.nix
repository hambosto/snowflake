{
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
        "gpu"
        "memory"
        {
          "type" = "disk";
          "format" = "{size-used} / {size-total} ({size-percentage})";
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
}
