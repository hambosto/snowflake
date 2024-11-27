{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.programs.zsh;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [bat ripgrep];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;

      initExtraFirst = ''
        fastfetch

        # Go configuration
        export GOPATH="$HOME/go"
        export PATH="$PATH:$GOPATH/bin"

        # Cargo configuration
        export PATH="$PATH:$HOME/.cargo/bin"
      '';

      history = {
        ignoreDups = true;
        save = 10000;
        size = 10000;
      };
    };
  };
}
