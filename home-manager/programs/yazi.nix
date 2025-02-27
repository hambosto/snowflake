{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.modules.programs.yazi;
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "5186af7984aa8cb0550358aefe751201d7a6b5a8";
    hash = "sha256-Cw5iMljJJkxOzAGjWGIlCa7gnItvBln60laFMf6PSPM=";
  };
in
{
  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      package = inputs.yazi.packages.x86_64-linux.default;
      enableZshIntegration = true;

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
          sort_by = "mtime";
          sort_dir_first = true;
          sort_reverse = true;
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
  };
}
