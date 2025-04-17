{
  services.resolved = {
    enable = true;
    # dnssec = "true";
    # domains = [ "~." ];
    fallbackDns = [
      # "1.1.1.1#one.one.one.one"
      # "1.0.0.1#one.one.one.one"
      "8.8.8.8"
      "8.8.4.4"
    ];
    # dnsovertls = "true";
  };
}
