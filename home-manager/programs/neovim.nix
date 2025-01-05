{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.neovim;
in
{
  config = lib.mkIf cfg.enable {
    programs.neovim.enable = true;
  };
}
