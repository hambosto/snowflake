{
  username,
  ...
}:
{
  stylix.targets = {
    vscode.enable = false;
    waybar.enable = false;
    firefox = {
      enable = true;
      profileNames = [ "${username}" ];
    };
  };
}
