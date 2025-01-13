{
  inputs,
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  cfg = config.modules.wayland.hyprpanel;
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];
  config = lib.mkIf cfg.enable {

    programs.hyprpanel = {
      enable = true;
      systemd.enable = true;
      hyprland.enable = true;
      overwrite.enable = true;
      overlay.enable = true;

      layout = {
        "bar.layouts" = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
            ];
            right = [
              "systray"
              "cava"
              "hyprsunset"
              "volume"
              "battery"
              # "bluetooth" enable this when is needed.
              "network"
              "clock"
              "notifications"
            ];
          };
        };
      };

      theme = "catppuccin_mocha";

      settings = {
        theme.font.name = "JetBrainsMono Nerd Font";
        theme.font.size = "14px";
        theme.bar.outer_spacing = "0px";
        theme.bar.buttons.y_margins = "0px";
        theme.bar.buttons.spacing = "0.1em";
        theme.bar.buttons.radius = "20px";
        theme.bar.scaling = 85;
        theme.bar.floating = true;
        theme.bar.buttons.padding_x = "0.8rem";
        theme.bar.buttons.padding_y = "0.4rem";
        theme.bar.margin_top = "2";
        theme.bar.margin_bottom = "2";
        theme.bar.margin_sides = "1px";
        theme.bar.border_radius = "20px";
        bar.launcher.icon = "󰊠";
        theme.bar.transparent = true;
        bar.customModules.updates.pollingInterval = 1440000;
        bar.workspaces.show_numbered = false;
        bar.workspaces.workspaces = 5;
        bar.workspaces.monitorSpecific = false;
        bar.windowtitle.label = true;
        bar.volume.label = true;
        bar.network.showWifiInfo = false;
        bar.network.label = false;
        bar.network.truncation = false;
        bar.bluetooth.label = false;
        bar.clock.format = "%H:%M %Z";
        bar.clock.showTime = true;
        bar.clock.showIcon = true;
        bar.clock.icon = "";
        bar.notifications.show_total = true;
        theme.notification.border_radius = "20px";
        theme.osd.enable = true;
        theme.osd.orientation = "vertical";
        theme.osd.location = "left";
        theme.osd.radius = "20px";
        theme.osd.margins = "0px 0px 0px 10px";
        theme.osd.muted_zero = true;
        menus.clock.weather.location = "${config.settings.system.location}";
        menus.clock.weather.key = "4afb0b6cb609401da30231750242807";
        menus.clock.weather.unit = "metric";
        menus.clock.time.military = true;
        menus.dashboard.stats.enabled = false;
        menus.dashboard.powermenu.avatar.image = "/home/${username}/.profile_picture.jpg";
        theme.bar.menus.menu.dashboard.profile.radius = "10em";
        menus.dashboard.powermenu.avatar.name = "${config.settings.system.fullName}";
        menus.dashboard.powermenu.confirmation = false;
        menus.dashboard.shortcuts.left.shortcut1.icon = "";
        menus.dashboard.shortcuts.left.shortcut1.command = "chromium";
        menus.dashboard.shortcuts.left.shortcut1.tooltip = "Chromium";
        menus.dashboard.shortcuts.left.shortcut2.icon = "";
        menus.dashboard.shortcuts.left.shortcut2.command = "${pkgs.kitty}/bin/kitty";
        menus.dashboard.shortcuts.left.shortcut2.tooltip = "Terminal";
        menus.dashboard.shortcuts.left.shortcut3.icon = "";
        menus.dashboard.shortcuts.left.shortcut3.command = "spotify";
        menus.dashboard.shortcuts.left.shortcut3.tooltip = "Spotify";
        menus.dashboard.shortcuts.left.shortcut4.icon = "";
        menus.dashboard.shortcuts.left.shortcut4.command = "menu";
        menus.dashboard.shortcuts.left.shortcut4.tooltip = "Search Apps";
        menus.dashboard.shortcuts.right.shortcut1.icon = "";
        menus.dashboard.shortcuts.right.shortcut1.command =
          "${pkgs.kitty}/bin/kitty -e ${pkgs.btop}/bin/btop";
        menus.dashboard.shortcuts.right.shortcut1.tooltip = "Resource Monitor";
        menus.dashboard.shortcuts.right.shortcut3.icon = "󰨞";
        menus.dashboard.shortcuts.right.shortcut3.command = "code";
        menus.dashboard.shortcuts.right.shortcut3.tooltip = "Visual Studio Code";
        menus.dashboard.directories.left.directory1.label = "󰉍 Downloads";
        menus.dashboard.directories.left.directory1.command =
          "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/Downloads";
        menus.dashboard.directories.left.directory2.label = "󰉏 Pictures";
        menus.dashboard.directories.left.directory2.command =
          "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/Pictures";
        menus.dashboard.directories.left.directory3.label = "󱧶 Documents";
        menus.dashboard.directories.left.directory3.command =
          "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/Documents";
        menus.dashboard.directories.right.directory1.label = "󱂵 Home";
        menus.dashboard.directories.right.directory1.command =
          "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME";
        menus.dashboard.directories.right.directory2.label = "󰚝 Projects";
        menus.dashboard.directories.right.directory2.command =
          "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/dev";
        menus.dashboard.directories.right.directory3.label = " Config";
        menus.dashboard.directories.right.directory3.command =
          "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/.config";
        menus.power.lowBatteryNotification = true;
        menus.power.lowBatteryThreshold = 20;
        theme.bar.menus.monochrome = false;
        wallpaper.enable = false;
        theme.bar.menus.card_radius = "20px";
        theme.bar.menus.border.size = "3px";
        theme.bar.menus.border.radius = "20px";
        theme.bar.buttons.monochrome = false;
        theme.bar.menus.menu.media.card.tint = 90;
        bar.customModules.hyprsunset.temperature = "4500k";
        bar.media.show_active_only = true;
        theme.bar.location = "top";
        bar.customModules.cava.showActiveOnly = true;
        bar.customModules.cava.showIcon = false;
      };
    };
  };
}
