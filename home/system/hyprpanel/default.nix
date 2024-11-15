{
  pkgs,
  config,
  ...
}: let
  inherit (config.var.system) username location;
  inherit (config.var.appearance.window) gaps rounding borderSize;
  inherit (config.var.appearance.bar) floating transparency position;

  font = "${config.stylix.fonts.serif.name}";
  fontSize = "${toString config.stylix.fonts.sizes.desktop}";
in {
  wayland.windowManager.hyprland.settings.exec-once = ["${pkgs.hyprpanel}/bin/hyprpanel"];

  home.packages = with pkgs; [hyprpanel libnotify];

  home.file.".cache/ags/hyprpanel/options.json" = {
    text =
      # json
      ''
        {
          "bar.layouts": {
            "0": {
              "left": ["dashboard", "workspaces", "windowtitle"],
              "middle": ["media"],
              "right": ["systray", "cpu", "ram", "volume", "bluetooth", "battery", "network", "clock", "notifications"]
            }
          },
          "theme.font.name": "${font}",
          "theme.font.size": "${fontSize}px",
          "theme.bar.outer_spacing": "${
          if floating && transparency.enabled
          then "0"
          else "8"
        }px",
          "theme.bar.buttons.y_margins": "${
          if floating && transparency.enabled
          then "0"
          else "8"
        }px",
          "theme.bar.buttons.spacing": "0.3em",
          "theme.bar.buttons.radius": "${
          if transparency.enabled
          then toString rounding
          else toString (rounding - 8)
        }px",
          "theme.bar.floating": ${
          if floating
          then "true"
          else "false"
        },
          "theme.bar.buttons.padding_x": "0.8rem",
          "theme.bar.buttons.padding_y": "0.4rem",

          "theme.bar.buttons.workspaces.hover": "#${config.lib.stylix.colors.base02}",
          "theme.bar.buttons.workspaces.active": "#${config.lib.stylix.colors.base0D}",
          "theme.bar.buttons.workspaces.available": "#${config.lib.stylix.colors.base01}",

          "theme.bar.margin_top": "${
          if position == "top"
          then toString (gaps.inner * 2)
          else "0"
        }px",
          "theme.bar.margin_bottom": "${
          if position == "top"
          then "0"
          else toString (gaps.inner * 2)
        }px",
          "theme.bar.margin_sides": "${toString gaps.outer}px",
          "theme.bar.border_radius": "${toString rounding}px",

          "bar.launcher.icon": "",
          "theme.bar.transparent": ${
          if transparency.enabled
          then "true"
          else "false"
        },
          "bar.workspaces.show_numbered": false,
          "bar.workspaces.workspaces": 5,
          "bar.workspaces.monitorSpecific": true,
          "bar.workspaces.hideUnoccupied": false,
          "bar.windowtitle.label": true,
          "bar.volume.label": false,
          "bar.network.truncation_size": 12,
          "bar.bluetooth.label": false,
          "bar.clock.format": "%a %b %d %H:%M %p",
          "bar.notifications.show_total": true,
          "theme.notification.border_radius": "${toString rounding}px",
          "theme.osd.enable": true,
          "theme.osd.orientation": "vertical",
          "theme.osd.location": "left",
          "theme.osd.radius": "${toString rounding}px",
          "theme.osd.margins": "0px 0px 0px 10px",
          "theme.osd.muted_zero": true,
          "menus.clock.weather.location": "${location}",
          "menus.clock.weather.key": "myapikey",
          "menus.clock.weather.unit": "metric",
          "menus.clock.time.military": true,
          "menus.dashboard.stats.enabled": false,
          "menus.dashboard.powermenu.avatar.image": "/home/${username}/.profile_picture.png",
          "menus.dashboard.powermenu.confirmation": false,

          "menus.dashboard.shortcuts.left.shortcut1.icon": "",
          "menus.dashboard.shortcuts.left.shortcut1.command": "firefox",
          "menus.dashboard.shortcuts.left.shortcut1.tooltip": "Firefox",
          "menus.dashboard.shortcuts.left.shortcut2.icon": "󰅶",
          "menus.dashboard.shortcuts.left.shortcut2.command": "caffeine",
          "menus.dashboard.shortcuts.left.shortcut2.tooltip": "Caffeine",
          "menus.dashboard.shortcuts.left.shortcut3.icon": "󰖔",
          "menus.dashboard.shortcuts.left.shortcut3.command": "night-shift",
          "menus.dashboard.shortcuts.left.shortcut3.tooltip": "Night Shift",
          "menus.dashboard.shortcuts.left.shortcut4.icon": "",
          "menus.dashboard.shortcuts.left.shortcut4.command": "menu",
          "menus.dashboard.shortcuts.left.shortcut4.tooltip": "Search Apps",
          "menus.dashboard.shortcuts.right.shortcut1.icon": "",
          "menus.dashboard.shortcuts.right.shortcut1.command": "${pkgs.kitty}/bin/kitty -e ${pkgs.btop}/bin/btop",
          "menus.dashboard.shortcuts.right.shortcut1.tooltip": "Resource Monitor",
          "menus.dashboard.shortcuts.right.shortcut3.icon": "󰨞",
          "menus.dashboard.shortcuts.right.shortcut3.command": "code",
          "menus.dashboard.shortcuts.right.shortcut3.tooltip": "Visual Studio Code",

          "menus.dashboard.directories.left.directory1.label": "󰉍 Downloads",
          "menus.dashboard.directories.left.directory1.command": "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/Downloads",
          "menus.dashboard.directories.left.directory2.label": "󰉏 Pictures",
          "menus.dashboard.directories.left.directory2.command": "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/Pictures",
          "menus.dashboard.directories.left.directory3.label": "󱧶 Documents",
          "menus.dashboard.directories.left.directory3.command": "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/Documents",
          "menus.dashboard.directories.right.directory1.label": "󱂵 Home",
          "menus.dashboard.directories.right.directory1.command": "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME",
          "menus.dashboard.directories.right.directory2.label": "󰚝 Projects",
          "menus.dashboard.directories.right.directory2.command": "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/dev",
          "menus.dashboard.directories.right.directory3.label": " Config",
          "menus.dashboard.directories.right.directory3.command": "${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi $HOME/.config",

          "theme.bar.menus.monochrome": false,
          "wallpaper.enable": false,
          "theme.bar.menus.background": "#${config.lib.stylix.colors.base00}",
          "theme.bar.menus.cards": "#${config.lib.stylix.colors.base01}",
          "theme.bar.menus.card_radius": "${toString rounding}px",
          "theme.bar.menus.label": "#${config.lib.stylix.colors.base05}",
          "theme.bar.menus.text": "#${config.lib.stylix.colors.base05}",
          "theme.bar.menus.border.size": "${toString borderSize}px",
          "theme.bar.menus.border.color": "#${config.lib.stylix.colors.base0D}",
          "theme.bar.menus.border.radius": "${toString rounding}px",
          "theme.bar.menus.popover.text": "#${config.lib.stylix.colors.base06}",
          "theme.bar.menus.popover.background": "#${config.lib.stylix.colors.base01}",
          "theme.bar.menus.listitems.active": "#${config.lib.stylix.colors.base0D}",
          "theme.bar.menus.icons.active": "#${config.lib.stylix.colors.base0E}",
          "theme.bar.menus.switch.enabled": "#${config.lib.stylix.colors.base0B}",
          "theme.bar.menus.check_radio_button.active": "#${config.lib.stylix.colors.base0B}",
          "theme.bar.menus.buttons.default": "#${config.lib.stylix.colors.base0D}",
          "theme.bar.menus.buttons.active": "#${config.lib.stylix.colors.base0E}",
          "theme.bar.menus.iconbuttons.active": "#${config.lib.stylix.colors.base0C}",
          "theme.bar.menus.progressbar.foreground": "#${config.lib.stylix.colors.base0B}",
          "theme.bar.menus.slider.primary": "#${config.lib.stylix.colors.base0D}",
          "theme.bar.menus.tooltip.background": "#${config.lib.stylix.colors.base01}",
          "theme.bar.menus.tooltip.text": "#${config.lib.stylix.colors.base06}",
          "theme.bar.menus.dropdownmenu.background": "#${config.lib.stylix.colors.base01}",
          "theme.bar.menus.dropdownmenu.text": "#${config.lib.stylix.colors.base05}",
          "theme.bar.background": "#${
          config.lib.stylix.colors.base00
          + (
            if transparency.buttonsTransparent
            then "00"
            else ""
          )
        }",
          "theme.bar.buttons.style": "default",
          "theme.bar.buttons.monochrome": false,
          "theme.bar.buttons.text": "#${config.lib.stylix.colors.base05}",
          "theme.bar.buttons.background": "#${
          (
            if transparency.enabled
            then config.lib.stylix.colors.base00
            else config.lib.stylix.colors.base01
          )
          + (
            if transparency.buttonsTransparent
            then "00"
            else ""
          )
        }",
          "theme.bar.buttons.icon": "#${config.lib.stylix.colors.base0C}",
          "theme.bar.buttons.notifications.background": "#${config.lib.stylix.colors.base01}",
          "theme.bar.buttons.hover": "#${config.lib.stylix.colors.base02}",
          "theme.bar.buttons.notifications.hover": "#${config.lib.stylix.colors.base02}",
          "theme.bar.buttons.notifications.total": "#${config.lib.stylix.colors.base08}",
          "theme.bar.buttons.notifications.icon": "#${config.lib.stylix.colors.base09}",
          "theme.notification.background": "#${config.lib.stylix.colors.base01}",
          "theme.notification.actions.background": "#${config.lib.stylix.colors.base0D}",
          "theme.notification.actions.text": "#${config.lib.stylix.colors.base07}",
          "theme.notification.label": "#${config.lib.stylix.colors.base0E}",
          "theme.notification.border": "#${config.lib.stylix.colors.base02}",
          "theme.notification.text": "#${config.lib.stylix.colors.base05}",
          "theme.notification.labelicon": "#${config.lib.stylix.colors.base0C}",
          "theme.osd.bar_color": "#${config.lib.stylix.colors.base0B}",
          "theme.osd.bar_overflow_color": "#${config.lib.stylix.colors.base08}",
          "theme.osd.icon": "#${config.lib.stylix.colors.base00}",
          "theme.osd.icon_container": "#${config.lib.stylix.colors.base0D}",
          "theme.osd.label": "#${config.lib.stylix.colors.base0E}",
          "theme.osd.bar_container": "#${config.lib.stylix.colors.base01}",
          "theme.bar.menus.menu.media.background.color": "#${config.lib.stylix.colors.base01}",
          "theme.bar.menus.menu.media.card.color": "#${config.lib.stylix.colors.base02}",
          "theme.bar.menus.menu.media.card.tint": 90,
          "bar.customModules.updates.pollingInterval": 1440000,
          "bar.media.show_active_only": true,
          "theme.bar.location": "${position}"
        }
      '';
  };
}
