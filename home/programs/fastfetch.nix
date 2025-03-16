{
  programs.fastfetch = {
    enable = true;
    settings = {

      logo = {
        source = ../../assets/nixos-logo.png;
        type = "auto";
        height = 10;
        width = 20;
        padding = {
          top = 2;
          left = 2;
        };
      };

      display = {
        color = {
          keys = "35";
        };
        separator = " ➜ ";
      };

      modules = [
        "break"
        {
          type = "os";
          key = "OS   ";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "31";
        }
        {
          type = "packages";
          key = " ├ 󰏖 ";
          keyColor = "31";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "31";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
          keyColor = "32";
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
          keyColor = "32";
        }
        {
          type = "icons";
          key = " ├ 󰀻 ";
          keyColor = "32";
        }
        {
          type = "cursor";
          key = " ├  ";
          keyColor = "32";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "32";
        }
        {
          type = "terminalfont";
          key = " └  ";
          keyColor = "32";
        }
        "break"
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = "PC   ";
          keyColor = "33";
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7} GHz";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "gpu";
          format = "{1} {2} ";
          key = " ├ 󰢮 ";
          keyColor = "33";
        }

        {
          type = "memory";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "33";
        }
        {
          type = "monitor";
          key = " └  ";
          keyColor = "33";
        }
        {
          type = "player";
          key = "└ 󰥠 ";
          keyColor = "33";
        }

        {
          type = "media";
          key = " └ 󰝚 ";
          keyColor = "33";
        }
      ];
    };
  };
}
