{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.ubuntu
      nerd-fonts.caskaydia-cove
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
