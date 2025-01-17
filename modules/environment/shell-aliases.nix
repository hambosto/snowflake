{
  environment.shellAliases = {
    cd = "z";
    cat = "bat --paging=never";
    ls = "eza --icons=always --no-quotes";
    ll = "eza -al --icons=always";
    lt = "eza -a --tree --level=1 --icons=always";
    tree = "eza --icons=always --tree --no-quotes";
    ssh = "kitty +kitten ssh";
    scrcpy-max = "scrcpy --turn-screen-off --disable-screensaver --show-touches --stay-awake --video-codec=h265 --video-bit-rate=16M --audio-bit-rate=256K --max-fps=144";
  };
}
