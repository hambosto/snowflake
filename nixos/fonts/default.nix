{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.comic-shanns-mono
      nerd-fonts.jetbrains-mono
    ];

    enableDefaultPackages = false;

    fontconfig = {
      antialias = true;
      cache32Bit = true;
      hinting = {
        enable = true;
        autohint = true;
      };
    };
  };
}
