{pkgs, ...}: {
  chaotic.scx.enable = true;
  chaotic.scx.scheduler = "scx_rusty";
  boot = {
    bootspec.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_cachyos-lto;
  };
}
