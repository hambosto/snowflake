{
  lib,
  pkgs,
  ...
}:
let
  android-mirror = pkgs.writeShellScriptBin "android-mirror" ''
    sudo ${lib.getExe' pkgs.android-tools "adb"} devices
    ${lib.getExe pkgs.scrcpy} --turn-screen-off --disable-screensaver --show-touches --stay-awake --video-codec=h265 --video-bit-rate=16M --audio-bit-rate=256K --max-fps=144
  '';
in
{
  home.packages = [ android-mirror ];
}
