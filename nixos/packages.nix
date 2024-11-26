{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fd
    bc
    gcc
    xdg-utils
    wget
    curl

    nixd
    alejandra
    deadnix
    statix
  ];
}
