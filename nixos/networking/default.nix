{ hostname, ... }:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.macAddress = "random";
  networking.hostName = hostname;
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
}
