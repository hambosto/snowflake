{
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set fish_greeting
      ${pkgs.fastfetch}/bin/fastfetch
    '';
    shellAliases = {
      cd = "z";
      cat = "bat --paging=never";
      ls = "eza --icons=always --no-quotes";
      ll = "eza -al --icons=always";
      lt = "eza -a --tree --level=1 --icons=always";
      tree = "eza --icons=always --tree --no-quotes";
    };
  };
}
