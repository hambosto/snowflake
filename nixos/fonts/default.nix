{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [ fira-code ];

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
