{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.x86_64-linux.hyprland;

    settings = {
      "$mainMod" = "SUPER";

      monitor = [ ", preferred, auto, 1, bitdepth, 10" ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"

        "GDK_SCALE,1"

        "GDK_BACKEND,wayland,x11,*"
        "CLUTTER_BACKEND,wayland"

        "MOZ_ENABLE_WAYLAND,1"

        "APPIMAGELAUNCHER_DISABLE,1"

        "OZONE_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
      ];

      general = {
        gaps_in = 1;
        gaps_out = 1;
        border_size = 3;
        resize_on_border = true;
        layout = "dwindle";
        "col.active_border" =
          lib.mkForce "rgb(${config.lib.stylix.colors.base08}) rgb(${config.lib.stylix.colors.base09}) rgb(${config.lib.stylix.colors.base0A}) rgb(${config.lib.stylix.colors.base0B}) rgb(${config.lib.stylix.colors.base0C}) rgb(${config.lib.stylix.colors.base0D}) 270deg";
        "col.inactive_border" =
          lib.mkForce "rgb(${config.lib.stylix.colors.base08}) rgb(${config.lib.stylix.colors.base09}) rgb(${config.lib.stylix.colors.base0A}) rgb(${config.lib.stylix.colors.base0B}) rgb(${config.lib.stylix.colors.base0C}) rgb(${config.lib.stylix.colors.base0D}) 270deg";
      };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, once"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      decoration = {
        active_opacity = 1;
        inactive_opacity = 1;
        rounding = 15;

        shadow = {
          enabled = true;
          range = 10;
          render_power = 3;
          offset = "12 12";
          scale = 0.97;
        };

        blur = {
          enabled = true;
          size = 16;
          xray = true;
          new_optimizations = "on";
          brightness = 0.8;
          contrast = 0.9;
          noise = 0.01;
          passes = 4;
          ignore_opacity = true;
        };
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        numlock_by_default = true;
        mouse_refocus = false;
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
          middle_button_emulation = true;
          clickfinger_behavior = false;
          disable_while_typing = true;
          scroll_factor = 1.0;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 1;
      };

      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "move 69.5% 4%, title:^(Picture-in-Picture)$"

        "float, class:(org.nickvision.cavalier)"
        "pin, class:(org.nickvision.cavalier)"
        "size 400 726,class:(org.nickvision.cavalier)"
        "move 100%-w-16 66,class:(org.nickvision.cavalier)"

        "float,class:Wallpaper Manager"
        "float,class:About Wallpaper Manager"
      ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      bind = [
        "$mainMod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
        "$mainMod, E, exec, ${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi"
        "$mainMod, M, exec, ${pkgs.kitty}/bin/kitty -e ${pkgs.btop}/bin/btop"
        "$mainMod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
        "$mainMod, B, exec, ${pkgs.chromium}/bin/chromium"
        "$mainMod, SPACE, exec, menu"

        "$mainMod SHIFT, W, exec, wallpaper-manager"

        "$mainMod, Q, killactive"
        "$mainMod, T, togglefloating"
        "$mainMod, F, fullscreen"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        ",PRINT, exec, screenshot selection"
        "$mainMod, PRINT, exec, screenshot active"
        "SHIFT, PRINT, exec, screenshot everything"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod ALT, left, swapwindow, l"
        "$mainMod ALT, right, swapwindow, r"
        "$mainMod ALT, up, swapwindow, u"
        "$mainMod ALT, down, swapwindow, d"

        "$mainMod, Tab, workspace, m+1"
        "$mainMod SHIFT, Tab, workspace, m-1"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod CTRL, down, workspace, empty"

      ];

      bindm = [
        "$mainMod,mouse:272, movewindow"
        "$mainMod,mouse:273, resizewindow"
      ];

      bindl = [ ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ];

      bindle = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
        ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
      ];
    };
  };
}
