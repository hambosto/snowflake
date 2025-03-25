{
  config,
  ...
}:
{
  services.swaync = {
    enable = false;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 500;
      control-center-height = 1025;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴 Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 1;
          text = "Notification Center";
        };
        mpris = {
          image-size = 96;
          image-radius = 7;
        };
        volume = {
          label = "󰕾";
        };
        backlight = {
          label = "󰃟";
        };
      };
      widgets = [
        "title"
        "mpris"
        "volume"
        "backlight"
        "dnd"
        "notifications"
      ];
    };
    style = ''
      /* Colors using stylix */
      @define-color background #${config.lib.stylix.colors.base00};
      @define-color groupbackground #${config.lib.stylix.colors.base01};
      @define-color buttoncolor #${config.lib.stylix.colors.base02};
      @define-color bordercolor #${config.lib.stylix.colors.base0D};
      @define-color fontcolor #${config.lib.stylix.colors.base05};
      @define-color accentcolor #${config.lib.stylix.colors.base0D};
      @define-color warningcolor #${config.lib.stylix.colors.base09};
      @define-color criticalcolor #${config.lib.stylix.colors.base08};

      * {
          font-family: "JetBrainsMono Nerd Font Mono";
          color: @fontcolor;
      }

      /* Control Center */
      .control-center {
          background: @background;
          border: 2px solid @bordercolor;
          border-radius: 10px;
          padding: 10px;
      }

      .notification-row:focus,
      .notification-row:hover {
          background: @groupbackground;
          border-radius: 8px;
      }

      button {
          background: @buttoncolor;
          border: none;
          border-radius: 8px;
          min-width: 35px;
          padding: 8px;
          margin: 2px;
      }

      button:hover {
          background: @accentcolor;
      }

      .widget-buttons-grid {
          padding: 8px;
          margin: 8px;
          background: @groupbackground;
          border-radius: 10px;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button {
          margin: 5px;
          padding: 8px;
      }

      .widget-title {
          margin: 10px;
          font-size: 1.3em;
      }

      .widget-dnd {
          margin: 8px;
          padding: 8px;
          background: @groupbackground;
          border-radius: 10px;
      }

      .widget-mpris {
          margin: 8px;
          padding: 12px;
          background: @groupbackground;
          border-radius: 10px;
      }

      /* Notifications */
      .notification {
          background: @background;
          border: 2px solid @bordercolor;
          border-radius: 10px;
          padding: 10px;
          margin: 8px;
      }

      .notification-content {
          padding: 8px;
          background: @groupbackground;
          border-radius: 8px;
      }

      .notification.critical {
          border-color: @criticalcolor;
      }

      .notification.low {
          border-color: @warningcolor;
      }

      .notification-default-action,
      .notification-action {
          padding: 4px;
          margin: 4px;
          border-radius: 6px;
      }

      .notification-default-action:hover,
      .notification-action:hover {
          background: @accentcolor;
      }

      .notification-default-action {
          border-radius: 8px;
      }

      .notification-default-action:not(:only-child) {
          border-bottom-left-radius: 0px;
          border-bottom-right-radius: 0px;
      }

      .notification-action {
          border-radius: 0px;
      }

      .notification-action:first-child {
          border-bottom-left-radius: 8px;
      }

      .notification-action:last-child {
          border-bottom-right-radius: 8px;
      }

      /* Volume and Brightness Sliders */
      .volume-slider slider,
      .brightness-slider slider {
          background: @groupbackground;
          border-radius: 8px;
          min-height: 8px;
      }

      .volume-slider slider highlight,
      .brightness-slider slider highlight {
          background: @accentcolor;
          border-radius: 8px;
      }

      .widget-volume .widget-volume-slider {
          margin: 8px;
          padding: 8px;
          background: @groupbackground;
          border-radius: 10px;
      }

      .widget-backlight .widget-backlight-slider {
          margin: 8px;
          padding: 8px;
          background: @groupbackground;
          border-radius: 10px;
      }
    '';
  };
}
