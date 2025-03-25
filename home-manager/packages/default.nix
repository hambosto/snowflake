{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nodejs

    peaclock
    cbonsai
    pipes
    cmatrix
  ];
}
