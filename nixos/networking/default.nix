{ hostname, ... }:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.wifi.powersave = false;
  networking.hostName = hostname;
  networking.useDHCP = false;
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General.AddressRandomization = "once";
      General.AddressRandomizationRange = "full";
    };
  };
}
