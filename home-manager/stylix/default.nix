{
  username,
  ...
}:
{
  stylix.targets = {
    vscode.enable = false;
    waybar.enable = false;
    floorp = {
      enable = true;
      profileNames = [ "${username}" ];
    };
  };
}
