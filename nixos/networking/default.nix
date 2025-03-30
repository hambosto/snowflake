{
  hostname,
  ...
}:
{
  networking.hostName = hostname;
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
}
