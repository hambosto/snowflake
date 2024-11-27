{config, ...}: {
  i18n.defaultLocale = config.settings.system.defaultLocale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = config.settings.system.extraLocale;
    LC_IDENTIFICATION = config.settings.system.extraLocale;
    LC_MEASUREMENT = config.settings.system.extraLocale;
    LC_MONETARY = config.settings.system.extraLocale;
    LC_NAME = config.settings.system.extraLocale;
    LC_NUMERIC = config.settings.system.extraLocale;
    LC_PAPER = config.settings.system.extraLocale;
    LC_TELEPHONE = config.settings.system.extraLocale;
    LC_TIME = config.settings.system.extraLocale;
  };
}
