{ hostname, ... }:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.macAddress = "random";
  networking.hostName = hostname;
}
