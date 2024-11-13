{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [ virt-manager ];

  users.users.${config.var.system.username} = { extraGroups = [ "libvirtd" ]; };
}
