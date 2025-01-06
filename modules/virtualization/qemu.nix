{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.settings.virtualization.qemu;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMFFull.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
    environment.systemPackages = with pkgs; [
      virt-manager
    ];
  };
}
