{
  hostname,
  ...
}:
{
  networking.hostName = hostname;
  networking.nameservers = [
    "1.1.1.1#one.one.one.one"
    "1.0.0.1#one.one.one.one"
  ];
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
}
