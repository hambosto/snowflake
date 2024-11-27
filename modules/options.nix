{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.settings;
in {
  options.settings = {
    system = {
      fullName = lib.mkOption {
        type = lib.types.str;
        default = "Anonymous";
        description = "User's full name for dashboard avatar";
      };

      configDirectory = lib.mkOption {
        type = lib.types.str;
        default = "/home/${config.home.username}/.config";
        description = "Configuration directory path";
      };

      location = lib.mkOption {
        type = lib.types.str;
        default = "Jakarta";
        description = "Geographical location";
      };

      timeZone = lib.mkOption {
        type = lib.types.str;
        default = "Asia/Jakarta";
        description = "System timezone";
      };

      defaultLocale = lib.mkOption {
        type = lib.types.str;
        default = "en_US.UTF-8";
        description = "Default system locale";
      };

      extraLocale = lib.mkOption {
        type = lib.types.str;
        default = "id_ID.UTF-8";
        description = "Additional system locale";
      };

      keyboardLayout = lib.mkOption {
        type = lib.types.str;
        default = "us";
        description = "Keyboard layout";
      };
    };

    git = {
      username = lib.mkOption {
        type = lib.types.str;
        default = "Anonymous";
        description = "Git username";
      };

      email = lib.mkOption {
        type = lib.types.str;
        default = "anonymous@example.com";
        description = "Git email address";
      };
    };

    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = "Path to wallpaper image";
    };

    plymouth = {
      enable = lib.mkEnableOption "Enable Plymouth";
      themesPackage = lib.mkOption {
        default = pkgs.adi1090x-plymouth-themes.override {selected_themes = [cfg.plymouth.theme];};
        type = lib.types.package;
      };
      theme = lib.mkOption {
        type = lib.types.str;
        default = "rings";
      };
    };
  };
}
