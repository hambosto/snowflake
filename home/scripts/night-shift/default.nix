{pkgs, ...}: let
  value = "4500";

  night-shift-on =
    pkgs.writeShellScriptBin "night-shift-on"
    # bash
    ''
      ${pkgs.hyprsunset}/bin/hyprsunset -t ${value} &
      title="󰖔  Night-Shift Activated"
      description="Night-Shift is now activated! Your screen will be warmer and easier on the eyes."

      notif "night-shift" "$title" "$description"
    '';

  night-shift-off =
    pkgs.writeShellScriptBin "night-shift-off"
    # bash
    ''
      pkill hyprsunset
      title="󰖕  Night-Shift Deactivated"
      description="Night-Shift is now deactivated! Your screen will return to normal."

      notif "night-shift" "$title" "$description"
    '';

  night-shift =
    pkgs.writeShellScriptBin "night-shift"
    # bash
    ''
      if pidof "hyprsunset"; then
        night-shift-off
      else
        night-shift-on
      fi
    '';

  night-shift-status =
    pkgs.writeShellScriptBin "night-shift-status"
    # bash
    ''
      if pidof "hyprsunset"; then
        echo "1"
      else
        echo "0"
      fi
    '';

  night-shift-status-icon =
    pkgs.writeShellScriptBin "night-shift-status-icon"
    # bash
    ''
      if pidof "hyprsunset"; then
          echo "󰖔"
        else
          echo "󰖕"
        fi
    '';
in {
  home.packages = [
    pkgs.hyprsunset
    night-shift-on
    night-shift-off
    night-shift
    night-shift-status
    night-shift-status-icon
  ];
}
