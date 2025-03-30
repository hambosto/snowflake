{
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    dnsovertls = "true";
  };
}
