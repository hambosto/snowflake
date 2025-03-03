{
  lib,
  ...
}:
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        grace = 2;
      };

      background = lib.mkForce {
        blur_passes = 3;
        blur_size = 10;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
      };

      label = {
        text = "パスワードをご入力ください";
        color = "rgba(222, 222, 222, 1.0)";
        font_size = 50;
        font_family = "Noto Sans CJK JP";
        position = "0, 70";
        halign = "center";
        valign = "center";
      };

      input-field = {
        size = "50, 50";
        dots_size = 0.33;
        dots_spacing = 0.15;
        outer_color = lib.mkForce "rgba(25, 20, 20, 0)";
        inner_color = lib.mkForce "rgba(25, 20, 20, 0)";
        font_color = lib.mkForce "rgba(222, 222, 222, 1.0)";
        placeholder_text = "パスワード";
      };
    };
  };
}
