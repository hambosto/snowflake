{
  username,
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = ["networkmanager" "wheel"];
    };
  };
  console.keyMap = config.settings.system.keyboardLayout;
}
