{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.geist-mono
      nerd-fonts.comic-shanns-mono
    ];

    enableDefaultPackages = false;

    fontconfig = {
      antialias = true;
      cache32Bit = true;
      hinting = {
        enable = true;
        autohint = true;
      };
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
