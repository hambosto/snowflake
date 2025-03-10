{
  inputs,
  ...
}:
{
  imports = [ inputs.go-encryption.nixosModules.default ];

  programs.go-encryption.enable = false;
}
