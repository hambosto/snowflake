{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    # commandLineArgs = [ "--ozone-platform-hint=wayland" ];
    extensions = [
      # "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      # "bfnaelmomeimhlpmgjnjophhpkkoljpa" # Phantom Wallet
      # "nkbihfbeogaeaoehlefnkodbefgpgknn" # MetaMask
      "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for GitHub
    ];
  };
}
