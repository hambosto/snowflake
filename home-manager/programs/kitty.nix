{
  lib,
  ...
}:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Cascadia Code";
      font_size = 12;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      remember_window_size = "no";
      initial_window_width = 950;
      initial_window_height = 500;
      cursor_blink_interval = 0.5;
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      enable_audio_bell = "no";
      window_padding_width = 10;
      hide_window_decorations = "yes";
      background_blur = 10;
      background_opacity = lib.mkForce 0.4;
      dynamic_background_opacity = "yes";
      confirm_os_window_close = 0;
      selection_foreground = "none";
      selection_background = "none";
      shell_integration = true;
      cursor_trail = 10;
      cursor_trail_start_threshold = 0;
      cursor_trail_decay = "0.01 0.15";
      cursor_shape = "block";
      cursor_blink = true;
    };
  };
}
