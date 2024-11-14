{config, ...}: {
  virtualisation.docker.enable = true;

  users.users.${config.var.system.username} = {extraGroups = ["docker"];};
}
