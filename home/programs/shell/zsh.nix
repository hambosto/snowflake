{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [bat ripgrep tldr sesh];

  home.sessionPath = ["$HOME/go/bin"];

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

    profileExtra = lib.optionalString (config.home.sessionPath != []) ''
      export PATH="$PATH''${PATH:+:}${
        lib.concatStringsSep ":" config.home.sessionPath
      }"
    '';

    shellAliases = {
      cd = "z";
      ls = "eza --icons=always --no-quotes";
      ll = "eza -al --icons=always";
      lt = "eza -a --tree --level=1 --icons=always";
      tree = "eza --icons=always --tree --no-quotes";
    };
  };
}
