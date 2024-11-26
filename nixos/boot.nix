{pkgs, ...}: {
  boot = {
    plymouth.enable = true;
    bootspec.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
