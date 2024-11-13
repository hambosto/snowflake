{ config, ... }:
let inherit (config.var.git) username email;
in {
  programs.git = {
    enable = true;
    userName = username;
    userEmail = email;
  };
}
