{ config, ... }:
{
  programs.nh = {
    enable = true;
    flake = "${config.xdg.configHome}/snowflake";
    clean.enable = false;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
