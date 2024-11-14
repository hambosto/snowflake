{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    nodejs
    python3
    python3Packages.pip
    sqlc
    go-migrate
  ];
}
