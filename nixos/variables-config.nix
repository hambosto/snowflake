{lib, ...}: {
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Main configuration for system variables.";
    };
  };
}
