{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
    };
  };
  users.defaultUserShell = pkgs.fish;
}
