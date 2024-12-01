{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  wallpaper-activator = pkgs.writeShellScript "wallpaper-activator" ''
    WALLPAPER_CACHE="$HOME/.cache/.active_wallpaper"

    # Check if the cache file exists
    if [ ! -f "$WALLPAPER_CACHE" ]; then
      exit 0
    fi

    # Read the wallpaper path from the cache
    SELECTED_IMAGE=$(<"$WALLPAPER_CACHE")

    # Verify the image exists
    if [ ! -f "$SELECTED_IMAGE" ]; then
      exit 1
    fi

    # Get all monitors using jq
    MONITORS=$(hyprctl -j monitors | ${pkgs.jq}/bin/jq -r '.[].name')

    # Apply wallpaper to all monitors
    hyprctl hyprpaper unload all > /dev/null 2>&1
    hyprctl hyprpaper preload "$SELECTED_IMAGE" > /dev/null 2>&1
    for monitor in $MONITORS; do
      hyprctl hyprpaper wallpaper "$monitor, $SELECTED_IMAGE" > /dev/null 2>&1
    done

    exit 0
  '';
  cfg = config.modules.wayland.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;

      settings = {
        "$mod" = "SUPER";
        "$shiftMod" = "SUPER_SHIFT";

        # Monitor setup
        monitor = [ ",preferred,auto,1" ];

        # System environment variables
        env = [
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "GDK_BACKEND,wayland,x11,*"
          "QT_QPA_PLATFORM,wayland;xcb"
          "CLUTTER_BACKEND,wayland"
          "QT_QPA_PLATFORMTHEME,qt6ct"
          "QT_QPA_PLATFORMTHEME,qt5ct"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
          "GDK_SCALE,1"
          "MOZ_ENABLE_WAYLAND,1"
          "OZONE_PLATFORM,wayland"
          "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        ];

        # Window management and layout
        general = {
          resize_on_border = true;
          gaps_in = 1;
          gaps_out = 1;
          border_size = 3;
          border_part_of_window = true;
          layout = "dwindle";
        };

        # Visual effects and animations
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

        # Window decorations and effects
        decoration = {
          active_opacity = 1;
          inactive_opacity = 1;
          rounding = 15;

          shadow = {
            enabled = true;
            range = 10;
            render_power = 3;
            scale = 0.97;
          };

          blur = {
            enabled = true;
            size = 16;
            xray = true;
            new_optimizations = "on";
            brightness = 0.8;
            contrast = 0.9;
            noise = 1.0e-2;
            passes = 4;
            ignore_opacity = true;
          };
        };

        # Input device configuration
        input = {
          kb_layout = config.settings.system.keyboardLayout;
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

        # Miscellaneous settings
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          initial_workspace_tracking = 1;
        };

        # Window and layer rules
        windowrulev2 = [
          "float, title:^(Picture-in-Picture)$"
          "pin, title:^(Picture-in-Picture)$"
          "move 69.5% 4%, title:^(Picture-in-Picture)$"
          "float,class:(window-floating)"
          "size 1000 700,class:(window-floating)"
          "center,class:(window-floating)"
          "pin, class:(window-floating)"
        ];

        # Gesture and cursor settings
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

        # Key bindings
        bind = [
          # Application launchers
          "$mod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
          "$mod, E, exec, ${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi"
          "$mod, M, exec, ${pkgs.kitty}/bin/kitty -e ${pkgs.btop}/bin/btop"
          "$mod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
          "$mod, B, exec, ${pkgs.firefox}/bin/firefox"
          "$mod, SPACE, exec, menu"
          "$mod, C, exec, quickmenu"

          # Window management
          "$mod, Q, killactive,"
          "$mod, T, togglefloating,"
          "$mod, F, fullscreen"
          "$shiftMod, SPACE, exec, hyprfocus-toggle"

          # Window focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # Monitor management
          "$shiftMod, up, focusmonitor, -1"
          "$shiftMod, down, focusmonitor, 1"

          # Layout controls
          "$shiftMod, left, layoutmsg, addmaster"
          "$shiftMod, right, layoutmsg, removemaster"

          # Screenshot controls
          ",PRINT, exec, screenshot selection"
          "$mod, PRINT, exec, screenshot active"
          "SHIFT, PRINT, exec, screenshot everything"

          # Random Wallpaper
          "$shiftMod, W, exec, ${pkgs.kitty}/bin/kitty --class window-floating -e wallpaper-selector"

          # Close active windows
          "$shiftMod, Q, exec, close-active-windows"

          # Workspace management
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          # Move windows to workspaces
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"
        ];

        # Mouse bindings
        bindm = [
          "$mod,mouse:272, movewindow"
          "$mod,mouse:273, resizewindow"
        ];

        # Hardware event bindings
        bindl = [
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
          ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
          ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ];

        # Volume and brightness controls
        bindle = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
          ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
        ];

        # Startup applications
        exec-once = [
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "sleep 1 && ${wallpaper-activator}"
        ];
      };
    };
  };
}
