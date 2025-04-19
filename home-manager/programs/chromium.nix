{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      # "bfnaelmomeimhlpmgjnjophhpkkoljpa" # Phantom Wallet
      # "nkbihfbeogaeaoehlefnkodbefgpgknn" # MetaMask
      "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for GitHub
    ];
  };
}
