{
  lib,
  pkgs,
  ...
}:
{
  stylix.targets.fish.enable = false;
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      ${lib.getExe pkgs.fastfetch}
    '';
    enable = true;
    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
    shellAliases = {
      cd = "z";
      cat = "bat --paging=never";
      ls = "eza --icons=always --no-quotes";
      ll = "eza -al --icons=always";
      lt = "eza -a --tree --level=1 --icons=always";
      tree = "eza --icons=always --tree --no-quotes";
      ssh = "kitty +kitten ssh";
      config = "hx ~/.config/snowflake";
      nos = "nh os switch";
    };
  };
}
