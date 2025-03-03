{
  username,
  ...
}:
{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/.config/snowflake";
    clean.enable = false;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
