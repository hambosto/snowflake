{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    wallpaper-manager.url = "github:hambosto/wallpaper-manager";
    helix-editor.url = "github:helix-editor/helix";
    stylix.url = "github:danth/stylix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nvf.url = "github:notashelf/nvf";
    nixcord.url = "github:kaylorben/nixcord";
    go-encryption.url = "github:hambosto/go-encryption";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      hostname = "snowflake";
      username = "ilham";
      fullname = "Ilham Putra Husada";
    in
    {
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit hostname;
          inherit fullname;
        };
        modules = [
          ./nixos/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
              inherit hostname;
              inherit system;
              inherit fullname;
            };
            home-manager.users.${username} = import ./home-manager;
          }
        ];
      };
    };
}
