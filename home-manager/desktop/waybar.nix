{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        modules-left = [
          "custom/launcher"
          "hyprland/window"
        ];
        modules-right = [
          "power-profiles-daemon"
          # "cpu"
          "network"
          # "memory"
          "pulseaudio"
          "backlight"
          "battery"
          "tray"
          "custom/notification"
          "clock"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          "persistent-workspaces" = {
            "*" = 5;
          };
        };

        "power-profiles-daemon" = {
          "format" = "{icon}";
          "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
          "tooltip" = true;
          "format-icons" = {
            "default" = "";
            "performance" = "";
            "balanced" = "";
            "power-saver" = "";
          };
        };

        "clock" = {
          format = " {:L%H:%M}";
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };

        "hyprland/window" = {
          max-length = 20;
          separate-outputs = false;
          rewrite = {
            "(.*) - Brave" = "$1";
            "(.*) - Chromium" = "$1";
            "(.*) - Brave Search" = "$1";
            "(.*) - Outlook" = "$1";
            "(.*) Microsoft Teams" = "$1";
          };
        };

        # "memory" = {
        #   interval = 5;
        #   format = " {}%";
        #   tooltip = true;
        # };

        # "cpu" = {
        #   interval = 5;
        #   format = " {usage:2}%";
        #   tooltip = true;
        # };

        # "disk" = {
        #   format = " {free}";
        #   tooltip = true;
        # };

        "network" = {
          interval = 1;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = " {bandwidthDownOctets}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = false;
          on-click = "${pkgs.kitty}/bin/kitty --class dotfiles-floating -e nmtui";
        };

        "tray" = {
          spacing = 12;
        };

        "backlight" = {
          "format" = "{icon} {percent}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          "scroll-step" = 1;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
        };

        "custom/power" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && wlogout";
        };

        "custom/launcher" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && rofi-launcher";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t";
          escape = true;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };
      }
    ];
    style = ''
      * {
          font-family: Ubuntu Nerd Font;
          border: none;
          border-radius: 0px;
      }

      window#waybar {
          background-color: rgba(0,0,0,0.2);
          border-bottom: 0px solid #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
      }

      .modules-left {
          padding-left: 14px;
      }

      /* Workspaces */
      #workspaces {
          background: #${config.lib.stylix.colors.base01};
          margin: 5px 1px 6px 1px;
          padding: 0px 1px;
          border-radius: 5px;
          border: 0px;
          font-weight: bold;
          font-style: normal;
          opacity: 0.8;
          font-size: 16px;
          color: #${config.lib.stylix.colors.base05};
      }

      #workspaces button {
          padding: 0px 5px;
          margin: 4px 3px;
          border-radius: 5px;
          border: 0px;
          color: #${config.lib.stylix.colors.base05};
          background-color: #${config.lib.stylix.colors.base02};
          transition: all 0.3s ease-in-out;
          opacity: 0.4;
      }

      #workspaces button.active {
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base0D};
          border-radius: 5px;
          min-width: 40px;
          transition: all 0.3s ease-in-out;
          opacity: 1.0;
      }

      #workspaces button:hover {
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base0D};
          border-radius: 15px;
          opacity: 0.7;
      }

      /* Window */
      #window {
          background: #${config.lib.stylix.colors.base01};
          margin: 8px 15px 8px 0px;
          padding: 2px 10px 0px 10px;
          border-radius: 5px;
          color: #${config.lib.stylix.colors.base05};
          font-size: 16px;
          font-weight: normal;
          opacity: 0.8;
      }

      window#waybar.empty #window {
          background-color: transparent;
      }

      /* Modules */
      #pulseaudio,
      /* #cpu, */
      /* #memory, */
      #network,
      #backlight,
      #battery,
      #clock,
      #tray,
      #backlight,
      #custom-notification,
      #power-profiles-daemon,
      #custom-launcher,
      #custom-power {
          background-color: #${config.lib.stylix.colors.base01};
          font-size: 16px;
          color: #${config.lib.stylix.colors.base05};
          border-radius: 5px;
          padding: 2px 10px 0px 10px;
          margin: 8px 10px 8px 0px;
          opacity: 0.8;
      }

      #idle_inhibitor {
          margin-right: 17px;
          font-size: 20px;
          font-weight: bold;
          opacity: 0.8;
          color: #${config.lib.stylix.colors.base0D};
      }

      #idle_inhibitor.activated {
          margin-right: 15px;
          color: #dc2f2f;
      }

      /* States */
      #battery.charging, 
      #battery.plugged {
          color: #${config.lib.stylix.colors.base05};
          background-color: #${config.lib.stylix.colors.base01};
      }

      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #network.disconnected {
          background-color: #dc2f2f;
      }

      #pulseaudio.muted {
          background-color: #${config.lib.stylix.colors.base00};
          color: #${config.lib.stylix.colors.base05};
      }

      /* Tooltip */
      tooltip {
          border-radius: 16px;
          background-color: #${config.lib.stylix.colors.base01};
          opacity: 0.9;
          padding: 20px;
          margin: 0px;
      }

      tooltip label {
          color: #${config.lib.stylix.colors.base05};
      }

      /* Tray */
      #tray {
          padding: 0px 15px 0px 0px;
          color: #${config.lib.stylix.colors.base05};
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
      }

      @keyframes blink {
          to {
              background-color: #${config.lib.stylix.colors.base01};
              color: #${config.lib.stylix.colors.base05};
          }
      }
    '';
  };

  wayland.windowManager.hyprland.settings.windowrulev2 = lib.mkIf config.programs.waybar.enable [
    "float,class:(dotfiles-floating)"
    "size 1000 700,class:(dotfiles-floating)"
    "center,class:(dotfiles-floating)"
    "pin, class:(dotfiles-floating)"
  ];
}
