{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_6_6;
  };
}
