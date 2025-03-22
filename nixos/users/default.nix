{
  username,
  fullname,
  ...
}:
{
  users.users."${username}" = {
    isNormalUser = true;
    description = "${fullname}";
    extraGroups = [
      "adbusers"
      "networkmanager"
      "wheel"
    ];
  };
}
