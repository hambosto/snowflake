{ pkgs, ... }: {
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        source = ./nixos.png;
        type = "kitty-direct";
        height = 15; # Reduced from 18 to 12
        width = 25; # Added width constraint for better proportions
        padding = {
          top = 1; # Minimal top padding
          left = 2; # Small left padding for alignment
        };
      };
      display = { separator = " "; };
      modules = [
        {
          key = "╭───────────╮";
          type = "custom";
        }
        {
          key = "│ {#31} user    {#keys}│";
          type = "title";
          format = "{user-name}";
        }
        {
          key = "│ {#32}󰇅 hname   {#keys}│";
          type = "title";
          format = "{host-name}";
        }
        {
          key = "│ {#33}󰅐 uptime  {#keys}│";
          type = "uptime";
        }
        {
          key = "│ {#34}{icon} distro  {#keys}│";
          type = "os";
        }
        {
          key = "│ {#35} kernel  {#keys}│";
          type = "kernel";
        }
        {
          key = "│ {#36}󰇄 desktop {#keys}│";
          type = "de";
        }
        {
          key = "│ {#31} term    {#keys}│";
          type = "terminal";
        }
        {
          key = "│ {#32} shell   {#keys}│";
          type = "shell";
        }
        {
          key = "│ {#33}󰍛 cpu     {#keys}│";
          type = "cpu";
          showPeCoreCount = true;
        }
        {
          key = "│ {#34}󰉉 disk    {#keys}│";
          type = "disk";
          folders = "/";
        }
        {
          key = "│ {#35} memory  {#keys}│";
          type = "memory";
        }
        {
          key = "│ {#36}󰩟 network {#keys}│";
          type = "localip";
          format = "{ipv4} ({ifname})";
        }
        {
          key = "├───────────┤";
          type = "custom";
        }
        {
          key = "│ {#39} colors  {#keys}│";
          type = "colors";
          symbol = "circle";
        }
        {
          key = "╰───────────╯";
          type = "custom";
        }
      ];
    };
  };
}
