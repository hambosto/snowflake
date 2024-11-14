{pkgs, ...}: let
  menu =
    pkgs.writeShellScriptBin "menu"
    # bash
    ''
      if pgrep -x "rofi" > /dev/null; then
        # Rofi is running, kill it
        pkill -x rofi
        exit 0
      fi
      rofi -show drun
    '';

  powermenu =
    pkgs.writeShellScriptBin "powermenu"
    # bash
    ''
      if pgrep -x rofi; then
        pkill -x rofi
        exit 0
      else
        options=(
          "󰌾 Lock"
          "󰍃 Logout"
          " Suspend"
          "󰑐 Reboot"
          "󰿅 Shutdown"
        )
        selected=$(printf '%s\n' "''${options[@]}" | rofi -dmenu -i -p " Powermenu")
        selected=''${selected:2}
        case $selected in
          "Lock")
            ${pkgs.hyprlock}/bin/hyprlock
            ;;
          "Logout")
            hyprctl dispatch exit
            ;;
          "Suspend")
            systemctl suspend
            ;;
          "Reboot")
            systemctl reboot
            ;;
          "Shutdown")
            systemctl poweroff
            ;;
        esac
      fi
    '';

  quickmenu =
    pkgs.writeShellScriptBin "quickmenu"
    # bash
    ''
      if pgrep -x rofi; then
        pkill -x rofi
      else
        options=(
          "󰅶 Caffeine"
          "󰖔 Night-shift"
          " Nixy"
          "󰈊 Hyprpicker"
        )
        selected=$(printf '%s\n' "''${options[@]}" | rofi -dmenu -i -p " Quickmenu")
        selected=''${selected:2}
        case $selected in
          "Caffeine")
            caffeine
            ;;
          "Night-shift")
            night-shift
            ;;
          "Nixy")
            kitty zsh -c nixy
            ;;
          "Hyprpicker")
            sleep 0.2 && ${pkgs.hyprpicker}/bin/hyprpicker -a
            ;;
        esac
      fi
    '';

  lock =
    pkgs.writeShellScriptBin "lock"
    # bash
    ''
      ${pkgs.hyprlock}/bin/hyprlock
    '';
in {home.packages = [menu powermenu lock quickmenu];}
