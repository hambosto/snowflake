{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.zsh;
in
{
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;

      initExtraFirst = ''
        fastfetch
      '';

      history = {
        ignoreDups = true;
        save = 10000;
        size = 10000;
      };
    };
  };
}
