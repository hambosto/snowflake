{
  username,
  config,
  ...
}:
{
  users = {
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
  console.keyMap = "us";
}
