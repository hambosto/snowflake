{
  config,
  pkgs,
  ...
}: let
  inherit (config.var.system) username;
in {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
