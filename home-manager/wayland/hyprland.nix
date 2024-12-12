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
        "$mainMod" = "SUPER";

        # Monitor setup
        monitor = [ "desc:Chimei Innolux Corporation 0x1441, preferred, auto, 1" ];

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
          gaps_in = 1;
          gaps_out = 1;
          border_size = 0;
          resize_on_border = true;
          border_part_of_window = true;
          layout = "dwindle";
        };

        # Visual effects and animations
        animations = {
          enabled = true;
          bezier = [
            "cosmic, 0.25, 0.1, 0.25, 1"
            "hyperfast, 0.16, 1, 0.3, 1"
            "hyperdynamic, 0.68, -0.55, 0.27, 1.55"
            "ultrasmooth, 0.45, 0, 0.55, 1"
            "workspace, 0.15, 0.9, 0.1, 1.1"
          ];
          animation = [
            "windows, 1, 7, cosmic, popin 30%"
            "windowsIn, 1, 5, hyperfast, slide"
            "windowsOut, 1, 7, hyperdynamic, slidevert"
            "border, 1, 10, default"
            "borderangle, 1, 50, ultrasmooth, once"
            "fade, 1, 5, cosmic"
            "workspaces, 1, 3, workspace, slide"
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

          "float,class:(terminal-floating)"
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

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        # Key bindings
        bind = [
          # Application launchers
          "$mainMod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
          "$mainMod, E, exec, ${pkgs.kitty}/bin/kitty -e ${pkgs.yazi}/bin/yazi"
          "$mainMod, M, exec, ${pkgs.kitty}/bin/kitty -e ${pkgs.btop}/bin/btop"
          "$mainMod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
          "$mainMod, B, exec, ${pkgs.firefox}/bin/firefox"
          "$mainMod, SPACE, exec, menu"

          # Window management
          "$mainMod, Q, killactive,"
          "$mainMod, T, togglefloating,"
          "$mainMod, F, fullscreen"

          # Window focus
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Screenshot controls
          ",PRINT, exec, screenshot selection"
          "$mainMod, PRINT, exec, screenshot active"
          "SHIFT, PRINT, exec, screenshot everything"

          # Wallpaper Selector
          "$mainMod SHIFT, W, exec, ${pkgs.kitty}/bin/kitty --class terminal-floating -e wallpaper-selector"

          # Close active windows
          "$mainMod SHIFT, Q, exec, close-active-windows"

          # Workspace management
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

          # Move windows to workspaces
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
        ];

        # Mouse bindings
        bindm = [
          "$mainMod,mouse:272, movewindow"
          "$mainMod,mouse:273, resizewindow"
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
        exec-once = [ "sleep 1 && ${wallpaper-activator}" ];
      };
    };
  };
}
