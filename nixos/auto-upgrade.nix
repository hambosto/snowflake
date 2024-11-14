{config, ...}: let
  configDir = config.var.system.configDirectory;
in {
  system.autoUpgrade = {
    enable = config.var.maintenance.autoUpgrade;
    dates = "04:00";
    flake = "${configDir}";
    flags = ["--update-input" "nixpkgs" "--commit-lock-file"];
    allowReboot = false;
  };
}
