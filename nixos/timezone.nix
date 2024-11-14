{config, ...}: {
  time.timeZone = config.var.system.timeZone;
  i18n.defaultLocale = config.var.system.defaultLocale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = config.var.system.extraLocale;
    LC_IDENTIFICATION = config.var.system.extraLocale;
    LC_MEASUREMENT = config.var.system.extraLocale;
    LC_MONETARY = config.var.system.extraLocale;
    LC_NAME = config.var.system.extraLocale;
    LC_NUMERIC = config.var.system.extraLocale;
    LC_PAPER = config.var.system.extraLocale;
    LC_TELEPHONE = config.var.system.extraLocale;
    LC_TIME = config.var.system.extraLocale;
  };
}
