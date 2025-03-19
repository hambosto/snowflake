{
  pkgs,
  ...
}:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "273019910c1111a388dd20e057606016f4bd0d17";
    hash = "sha256-80mR86UWgD11XuzpVNn56fmGRkvj0af2cFaZkU8M31I=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      mime-ext = "${yazi-plugins}/mime-ext.yazi";
      smart-filter = "${yazi-plugins}/smart-filter.yazi";
      mount = "${yazi-plugins}/mount.yazi";
    };

    initLua = ''
      require("full-border"):setup()
    '';

    settings = {
      log = {
        enabled = false;
      };
      manager = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
      };
    };

    keymap = {
      manager.prepend_keymap = [
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          on = "M";
          run = "plugin mount";
          desc = "Mount Disk";
        }
        {
          on = "F";
          run = "plugin smart-filter";
          desc = "Smart filter";
        }
      ];
    };
  };
}
