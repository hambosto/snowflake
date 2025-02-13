{ pkgs, ... }:
{
  services.scx = {
    enable = false;
    scheduler = "scx_rusty";
    package = pkgs.scx_git.full;
  };
}
