{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    mkSystem = hostname:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit hostname;
        };
        modules = [
          ./hosts/${hostname}/configuration.nix

          {
            nixpkgs.overlays = [
              inputs.hyprpanel.overlay
              (final: prev: {
                matugen = final.rustPlatform.buildRustPackage rec {
                  pname = "matugen";
                  version = "2.4.0";

                  src = final.fetchFromGitHub {
                    owner = "InioX";
                    repo = "matugen";
                    rev = "refs/tags/v${version}";
                    hash = "sha256-l623fIVhVCU/ylbBmohAtQNbK0YrWlEny0sC/vBJ+dU=";
                  };

                  cargoHash = "sha256-FwQhhwlldDskDzmIOxhwRuUv8NxXCxd3ZmOwqcuWz64=";

                  meta = {
                    description = "Material you color generation tool";
                    homepage = "https://github.com/InioX/matugen";
                    changelog = "https://github.com/InioX/matugen/blob/${src.rev}/CHANGELOG.md";
                    license = final.lib.licenses.gpl2Only;
                    maintainers = with final.lib.maintainers; [lampros];
                    mainProgram = "matugen";
                  };
                };
              })
            ];
          }

          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
  in {nixosConfigurations = {snowflake = mkSystem "snowflake";};};
}
