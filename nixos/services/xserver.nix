{
  pkgs,
  ...
}:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    excludePackages = [ pkgs.xterm ];
    videoDrivers = [ "amdgpu" ];
  };
}
