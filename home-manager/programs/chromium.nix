{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "hkgfoiooedgoejojocmhlaklaeopbecg" # Picture in Picture
      # "bfnaelmomeimhlpmgjnjophhpkkoljpa" # Phantom Wallet
      # "nkbihfbeogaeaoehlefnkodbefgpgknn" # MetaMask
      "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for GitHub
    ];
  };
}
