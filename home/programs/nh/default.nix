{ config, ... }: {
  programs.nh = {
    enable = true;
    flake = config.var.system.configDirectory;
    clean.enable = config.var.maintenance.autoGarbageCollector;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
